
require 'action_mailer'
require 'cloudflare/email/railtie'

RSpec.describe Cloudflare::Email::Railtie do
  describe 'Action Mailer setup' do
    before { Cloudflare::Email::Railtie.initializers.each(&:run) }

    it 'registers Cloudflare Email delivery method' do
      expect(ActionMailer::Base.delivery_methods).to include(cloudflare_email: Cloudflare::Email::DeliveryMethod)
    end
  end
end
