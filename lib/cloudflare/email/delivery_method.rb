# frozen_string_literal: true

module Cloudflare
  module Email
    class DeliveryMethod
      def initialize(settings)
        @settings = settings
      end

      def deliver!(mail)
        Cloudflare::Email::Sender.send_email(
          mail.to,
          mail.from,
          mail[:name].to_s,
          mail.subject,
          mail.body.to_s
        )
      end
    end
  end
end
