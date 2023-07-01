# frozen_string_literal: true

require "spec_helper"
require "cloudflare/email"

RSpec.describe Cloudflare::Email::Sender do
  describe "#run" do
    let(:http_response) { instance_double(Net::HTTPSuccess) }
    let(:http) { instance_double(Net::HTTP) }
    let(:request) { instance_double(Net::HTTP::Post) }

    before do
      allow(Net::HTTP).to receive(:new).and_return(http)
      allow(http).to receive(:use_ssl=)
      allow(Net::HTTP::Post).to receive(:new).and_return(request)
      allow(request).to receive(:body=)
      allow(http).to receive(:request).and_return(http_response)
    end

    context "when the request is successful" do
      before { allow(http_response).to receive(:is_a?).with(Net::HTTPSuccess).and_return(true) }

      it "returns true" do
        email_sender = Cloudflare::Email::Sender.new

        expect(email_sender.run(
                 to: "test@example.com",
                 from: "sender@example.com",
                 name: "Workers - MailChannels integration",
                 subject: "Look! No servers",
                 content: [{ type: "text/plain", value: "And no email service accounts and all for free too!" }]
               )).to eq(true)
      end
    end

    context "when the request is not successful" do
      before { allow(http_response).to receive(:is_a?).with(Net::HTTPSuccess).and_return(false) }

      it "returns false" do
        email_sender = Cloudflare::Email::Sender.new

        expect(email_sender.run(
                 to: "test@example.com",
                 from: "sender@example.com",
                 name: "Workers - MailChannels integration",
                 subject: "Look! No servers",
                 content: [{ type: "text/plain", value: "And no email service accounts and all for free too!" }]
               )).to eq(false)
      end
    end
  end
end
