class Client 
  
  include Mongoid::Document
  
  has_many :access_tokens
  has_many :refresh_tokens

  before_validation :init_identifier, :on => :create, :unless => Proc.new { |p| p.identifier.present?}
  before_validation :init_secret, :on => :create, :unless => Proc.new { |p| p.secret.present?}
  validates :name, :website, :redirect_uri, :secret, :presence => true
  validates :identifier, :presence => true, :uniqueness => true

  private

  def init_identifier
    self.identifier = Devise::Oauth2Providable.random_id
  end
  def init_secret
    self.secret = Devise::Oauth2Providable.random_id
  end
end
