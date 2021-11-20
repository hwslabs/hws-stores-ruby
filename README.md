# Hws::Stores

**Financial Primitive - Store**

This primitive is to contain and assign ownership for the value that is transacted in a financial usecase.
There are two entities - Store and Owner.

- Store - Holds the value that is managed in the usecase.
- Owner - This entity can be used to maintain the owner details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hws-stores'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hws-stores

## Usage

### Create an empty store

```ruby
Hws::Stores.create_store(name: 'test1', schema: {"type"=> "object", "require"=>["a"], "properties"=> {"a"=>{"type"=>"number"}}})
=> "619f5ce9-075b-0778-7969-7413c37452e9" # returns id of the created store
```

### Add data to store
```ruby
Hws::Stores.update_store("619f5ce9-075b-0778-7969-7413c37452e9", {"a": 54})
=> true # Update successful
```

### Create a store with data
```ruby

Hws::Stores.create_store(name: 'test1', schema: {"type"=> "object", "require"=>["a"], "properties"=> {"a"=>{"type"=>"number"}}}, data: {"a": 6})
=> "619f5ce9-075b-0778-7969-7413c37452e9" # returns id of the created store
```

### Delete a store
```ruby

Hws::Stores.delete_store("619f5ce9-075b-0778-7969-7413c37452e9")
=> true # Delete successful
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hwslabs/hws-stores. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hws::Stores project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hws-stores/blob/master/CODE_OF_CONDUCT.md).
