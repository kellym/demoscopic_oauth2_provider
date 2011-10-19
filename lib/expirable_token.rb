module ExpirableToken
  def self.included(klass)
    klass.class_eval do
      cattr_accessor :default_lifetime
      self.default_lifetime = 1.minute

      belongs_to :user, class_name: Devise.mappings[:user].class_name
      belongs_to :client
      
      field :token
      field :expires_at, type: Time

      before_validation :init_token, :on => :create, :unless => :token?
      before_validation :init_expires_at, :on => :create, :unless => :expires_at?
      validates :expires_at, :presence => true
      validates :client, :presence => true
      validates :token, :presence => true, :uniqueness => true

      default_scope -> { where(:expires_at.gte => Time.now.utc)  }

    end
  end

  def expires_in
    expires_at.utc.to_i - Time.now.utc.to_i
  end

  def expired!
    self.expires_at = Time.now.utc
    self.save!
  end

  private

  def init_token
    self.token = Devise::Oauth2Providable.random_id
  end
  def init_expires_at
    self.expires_at = self.default_lifetime.from_now
  end
end

