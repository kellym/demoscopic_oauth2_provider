require 'expirable_token'

class RefreshToken
  include Mongoid::Document
  include Mongoid::Timestamps
  
  include ExpirableToken
  self.default_lifetime = 1.month
  has_many :access_tokens
  
end
