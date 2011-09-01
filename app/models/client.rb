class Client 
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :oauth_identifier
  field :secret
  field :redirect_uri
  field :name
  field :website
  
  has_many :access_tokens
  has_many :refresh_tokens

  before_validation :init_oauth_identifier, :on => :create, :unless =>:oauth_identifier?
  before_validation :init_secret, :on => :create, :unless => :secret?
  validates :name, :website, :redirect_uri, :secret, :presence => true
  validates :oauth_identifier, :presence => true, :uniqueness => true

  private

  def init_oauth_identifier
    self.oauth_identifier = Devise::Oauth2Providable.random_id
  end
  def init_secret
    self.secret = Devise::Oauth2Providable.random_id
  end
end
