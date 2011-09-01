require 'demoscopic_oauth2_provider/strategies/oauth2_grant_type_strategy'

module Devise
  module Strategies
    class Oauth2RefreshTokenGrantTypeStrategy < Oauth2GrantTypeStrategy
      def grant_type
        'refresh_token'
      end

      def authenticate!
        if client && refresh_token = RefreshToken.first(conditions: {client_id: client.id, token: params[:refresh_token]})
          env['oauth2.refresh_token'] = refresh_token
          success! refresh_token.user
        elsif !halted?
          oauth_error! :invalid_grant, 'invalid refresh token'
        end
      end
    end
  end
end

Warden::Strategies.add(:oauth2_refresh_token_grantable, Devise::Strategies::Oauth2RefreshTokenGrantTypeStrategy)
