# Elevenstreet

A Ruby API for http://www.11street.my

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elevenstreet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elevenstreet

## Elevenstreet::Client

The client is the base for all communication with the API.

```ruby
client = Elevenstreet::Client.new(api_key)
```

## Elevenstreet::Client methods

### Elevenstreet::Client#upsert_product
Create or update product
```ruby
client.upsert_product({ 'prdNm'=> 'Product Name', 'dispCtgrNo' => 2, ... })
```

### Elevenstreet::Client#update_product_options
Update product options

```ruby
client.update_product_options(product_number, { 'optSelCnt' => 1, 'colTitle' => 'Size', ... })
```

### Elevenstreet::Client#product
Returns product detail
```ruby
client.product(product_number)
```

### Elevenstreet::Client#hide_product
Hide the product
```ruby
client.hide_product(product_number)
```

### Elevenstreet::Client#unhide_product
Re active the hidden product
```ruby
client.unhide_product(product_number)
```

### Elevenstreet::Client#update_product_price
Edit item price

```ruby
client.update_product_price(product_number, price)
```

### Elevenstreet::Client#product_stocks
Returns product stocks
```ruby
client.product_stocks(product_number)
```

### Elevenstreet::Client#categories
Returns full categories
```ruby
client.categories
```

### Elevenstreet::Client#sub_categories
Returns sub categories of a parent category
```ruby
client.sub_categories(parent_category_id)
```

### Elevenstreet::Client#order
Returns order detail
```ruby
client.order(order_nu)
```

### Elevenstreet::Client#completed_payments
Returns all completed payment orders
```ruby
client.completed_payments(start_time, end_time)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/elevenstreet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
