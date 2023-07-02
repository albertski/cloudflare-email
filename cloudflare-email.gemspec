# frozen_string_literal: true

require_relative "lib/cloudflare/email/version"

Gem::Specification.new do |spec|
  spec.name = "cloudflare-email"
  spec.version = Cloudflare::Email::VERSION
  spec.authors = ["Albert Jankowski"]
  spec.email = ["ajankowski@q-centrix.com"]

  spec.summary = "Send email using Cloudflare Workers with MailChannels"
  spec.description = "Send email using Cloudflare Workers with MailChannels"
  spec.homepage = "https://github.com/albertski/cloudflare-email"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/albertski/cloudflare-email"
  spec.metadata["changelog_uri"] = "https://github.com/albertski/cloudflare-email"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
