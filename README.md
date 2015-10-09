# Dashed

Dashed is a Ruby library for interacting with Amazon Dash button presses.

## Installation

Just add `dashed` to your Gemfile and then run `bundle install`.

Dashed has to be run with root permissions in order to listen to your network
devices to pick up your dash button.

## Preparing the buttons

In order to use your [dash buttons](http://www.amazon.com/oc/dash-button) with this library, you will need to set them up using Amazon's setup process. While you can automatically order products using the buttons, if you'd like to prevent the automatic ordering of a product, simply stop the  registration process before choosing a product.

It is recommended that you read [this post](https://medium.com/@edwardbenson/how-i-hacked-amazon-s-5-wifi-button-to-track-baby-data-794214b0bdd8) on Medium by Edward Benson describing how he uses the buttons. The article walks you through the process of getting the buttons set up; once you have reached the point that the button is connected through WiFi, this gem will take you the rest of the way!


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

## Known Issues

 - Buttons can not be sniffed out on some OS X machines
 - Some buttons seem to have a different version of the Amazon Dash button
   software that render them useless for this.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/kenyonj/dashed.
