module Devise
  module Oauth2Providable
    class Engine < Rails::Engine
      initializer "demoscopic_oauth2_provider.initialize_application" do |app|
        app.config.filter_parameters << :client_secret
      end
    end
  end
end

