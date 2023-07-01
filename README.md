# Cloudflare Email

[![GitHub Workflow Status](https://github.com/albertski/cloudflare-email/actions/workflows/main.yml/badge.svg)](https://github.com/albertski/cloudflare-email/actions)

The Cloudflare Email gem is a Ruby library for sending emails using Workers with MailChannels.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudflare-email'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cloudflare-email

## Usage

Require the gem and create an instance of the Cloudflare::Email::Sender class with your desired options:

```
require 'cloudflare/email'

email_sender = Cloudflare::Email::Sender.new

options = {
  to: 'test@example.com',
  from: 'sender@example.com',
  name: 'Workers - MailChannels integration',
  subject: 'Look! No servers',
  content: [
    {
      type: 'text/plain',
      value: 'And no email service accounts and all for free too!',
    },
  ],
}

email_sender.send_email(options)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/albertski/cloudflare-email. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/albertski/cloudflare-email/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cloudflare::Email project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/albertski/cloudflare-email/blob/main/CODE_OF_CONDUCT.md).
