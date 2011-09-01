require 'devise'
require 'rack/oauth2'
require 'demoscopic_oauth2_provider/strategy'
require 'demoscopic_oauth2_provider/model'
require 'demoscopic_oauth2_provider/engine'
require 'demoscopic_oauth2_provider/strategies/oauth2_password_grant_type_strategy'
require 'demoscopic_oauth2_provider/strategies/oauth2_refresh_token_grant_type_strategy'
require 'demoscopic_oauth2_provider/strategies/oauth2_authorization_code_grant_type_strategy'
require 'demoscopic_oauth2_provider/models/oauth2_scopes'
require 'demoscopic_oauth2_provider/models/oauth2_password_grantable'
require 'demoscopic_oauth2_provider/models/oauth2_refresh_token_grantable'
require 'demoscopic_oauth2_provider/models/oauth2_authorization_code_grantable'

module Devise
  module Oauth2Providable
    class << self
      def random_id
        SecureRandom.hex
      end
    end
  end
end

Devise.add_module(:oauth2_providable,
  :strategy => true,
  :model => 'demoscopic_oauth2_provider/model')
Devise.add_module(:oauth2_password_grantable, 
  :strategy => true,
  :model => 'demoscopic_oauth2_provider/models/oauth2_password_grantable')
Devise.add_module(:oauth2_refresh_token_grantable, 
  :strategy => true,
  :model => 'demoscopic_oauth2_provider/models/oauth2_refresh_token_grantable')
Devise.add_module(:oauth2_authorization_code_grantable,
  :strategy => true,
  :model => 'demoscopic_oauth2_provider/models/oauth2_authorization_code_grantable')
