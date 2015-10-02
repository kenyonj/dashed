# Dashed

Dashed is a Ruby library for interacting with Amazon Dash button presses.

## Installation

Just add `dashed` to your gemfile and then run `bundle install`.

Dashed has to be run with root permissions in order to listen to your network
devices to pick up your dash button.

## Usage

```
Dashed::Button.new("ff:ff:ff:ff:ff", "dummylan0") do
  puts "I was pressed!"
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/kenyonj/dashed.
