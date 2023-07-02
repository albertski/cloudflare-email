# frozen_string_literal: true

require_relative 'email/delivery_method'
require_relative 'email/railtie'
require_relative 'email/sender'
require_relative 'email/version'

module Cloudflare
  module Email
    class Error < StandardError; end
  end
end
