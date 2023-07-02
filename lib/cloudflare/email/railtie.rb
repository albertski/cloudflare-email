require "rails"

module Cloudflare
  module Email
    class Railtie < Rails::Railtie
      initializer "cloudflare_email.setup_action_mailer" do
        ActiveSupport.on_load :action_mailer do
          add_delivery_method :cloudflare_email, Cloudflare::Email::DeliveryMethod
        end
      end
    end
  end
end
