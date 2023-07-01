# frozen_string_literal: true

require "json"
require "net/http"

module Cloudflare
  module Email
    class Sender
      API_ENDPOINT = "https://api.mailchannels.net/tx/v1/send"

      def run(to:, from:, name:, subject:, content:)
        payload = build_payload(to, from, name, subject, content)
        response = send_request(payload)
        handle_response(response)
      end

      private

      def build_payload(to, from, name, subject, content)
        {
          personalizations: [{ to: [{ email: to, name: name }] }],
          from: {
            email: from,
            name: name
          },
          subject: subject,
          content: content
        }
      end

      def send_request(payload)
        uri = URI(API_ENDPOINT)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })
        request.body = payload.to_json

        http.request(request)
      end

      def handle_response(response)
        response.is_a?(Net::HTTPSuccess)
      end
    end
  end
end
