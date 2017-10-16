# Underarmour

## Disclaimer

This is very much still a work in progress & likely to change, feel free to contribute however you find fit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'underarmour'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install underarmour

## Usage

### Retrieve a User

```ruby

user = Underarmour::ApiClient.scoped_api_client(Underarmour::User, 'user/', access_token: 'YOUR_TOKEN', api_key: 'YOUR_CLIENT_API_KEY').find_self

```

### Retrieve an ActivityType

```ruby

activity_type = Underarmour::ApiClient.scoped_api_client(Underarmour::ActivityType, 'activity_type/',access_token: 'YOUR_TOKEN', api_key: 'YOUR_CLIENT_API_KEY').find(215)

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dezmathio/underarmour. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Underarmour project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/underarmour/blob/master/CODE_OF_CONDUCT.md).
