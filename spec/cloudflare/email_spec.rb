# frozen_string_literal: true

RSpec.describe Cloudflare::Email do
  it "has a version number" do
    expect(Cloudflare::Email::VERSION).not_to be nil
  end
end
