require 'devise/models'

module Devise
  module Models
    module Oauth2Providable
      extend ActiveSupport::Concern
      included do
        has_many :access_tokens
        has_many :authorization_codes
      end
    end
  end
end
