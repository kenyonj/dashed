# Dashed

Dashed is a Ruby library for interacting with Amazon Dash button presses.

## Installation

Just add `dashed` to your Gemfile and then run `bundle install`.

Dashed has to be run with root permissions in order to listen to your network
devices to pick up your dash button.

## Usage

Dashed includes the `find_dash` executable which looks for Amazon Dash buttons
based on their mac address. Once you've found your Dash buttons Mac Address you
can get started.

ex: `sudo find_dash dummylan0` where dummylan0 is the wifi interface to listen
on. Ensure your Amazon Dash button is connected to the same network.

Here is an example implementation:

```
Dashed::Button.new("ff:ff:ff:ff:ff", "dummylan0").on_press do
  puts "I was pressed!"
end
```

Please be aware that `on_press` blocks the execution of the current
thread. If you don't want it to block please create the button in its own
thread.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/kenyonj/dashed.
