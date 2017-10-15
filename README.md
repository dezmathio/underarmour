# Underarmour

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'underarmour'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install underarmour
    
## Setup Key Access from UnderArmour API for your app
You need to have access_key and api_key from the Under Armour API. This can be received from,
    https://developer.underarmour.com/signup

Your application needs to pass these keys to the underarmour gem by using dotenv. In your Gemfile add,
``` gem 'dotenv-rails' ```

Add the keys to the file .env in the repo home. The contents of the .env file will look like 

```
access_token=<your-value>
api_key=<your-value>
```

In your client code, include the following,

``` require 'dotenv/load' ```

Now you should be able to access the environment variable set in .env by using ENV['access_token'] and ENV['api_key']
    
## Usage

### Retrieve a User

```ruby

client = Underarmour::Client.new(access_token: 'YOUR_TOKEN', api_key: 'YOUR_CLIENT_API_KEY')
client.users.find(id: 1)

```

### Retrieve ActivityTypes

```ruby

client = Underarmour::Client.new(access_token: 'YOUR_TOKEN', api_key: 'YOUR_CLIENT_API_KEY')
client.activity_types.all

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/underarmour. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Underarmour project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/underarmour/blob/master/CODE_OF_CONDUCT.md).
