require 'expirable_token'

class AuthorizationCode 
  include Mongoid::Document
  include ExpirableToken
  def access_token
    @access_token ||= expired! && user.access_tokens.create(:client => client)
  end
  def valid_request?(req)
    self.redirect_uri == req.redirect_uri
  end
end
