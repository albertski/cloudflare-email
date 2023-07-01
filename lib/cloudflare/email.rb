# frozen_string_literal: true

require_relative "email/version"
require_relative "email/sender"

module Cloudflare
  module Email
    class Error < StandardError; end
  end
end
