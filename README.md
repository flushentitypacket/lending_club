# LendingClub

A Ruby wrapper for the [Lending Club API](https://www.lendingclub.com/developers/lc-api.action).

## Installation

    $ gem install lending_club

## Usage

### Obtain credentials
1. [Request access](https://www.lendingclub.com/account/profile.action) to the Lending Club API to obtain your key.
2. Log in to find your investor id. You can find it in your account summary ("My Account yourinvestorid").

### Example
```ruby
# Set credentials
LendingClub.access_token = 'abc123'
LendingClub.investor_id = '12345678'
# Make a call
summary = LendingClub.summary
# Check available cash
summary.available_cash
```

### Console
Create a credentials.yml from the example in the /config dir.

    $ rake console

The console task will load and set your credentials from the credentials.yml, so you can start using the API right away.

## Changelog
_0.0.2_
Added #to_h feature to all client objects.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lending_club/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credit

Credit where credit is due:
I modeled this gem closely after the Instagram API gem [instagram-ruby-gem](https://github.com/Instagram/instagram-ruby-gem).
