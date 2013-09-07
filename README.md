# OmniAuth::Mindbody
[![Build Status](https://travis-ci.org/wingrunr21/omniauth-mindbody.png)](https://travis-ci.org/wingrunr21/omniauth-mindbody) [![Gem Version](https://badge.fury.io/rb/omniauth-mindbody.png)](http://badge.fury.io/rb/omniauth-mindbody)

[MindBody API](https://www.mindbodyonline.com/developers) v0.5.x strategy for
OmniAuth 1.0

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-mindbody'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-mindbody

## Prereqs

You must sign up to be a [MindBody Partner](https://api.mindbodyonline.com/Home/LogIn) and have any sites you wish to access [authorize your source credentials](https://support.mindbodyonline.com/entries/21301433-how-to-access-client-data-using-the-mindbody-api).

## Usage

You must set your MindBody source name, key, and site ids so that the underlying
[mindbody-api gem](https://github.com/wingrunr21/mindbody-api) can pick them up.
These values are accessible via the [MindBody Partner Page](https://api.mindbodyonline.com/Home/LogIn)

The easiest way to set these is via three environment variables:
`MINDBODY_SOURCE_NAME`, `MINDBODY_SOURCE_KEY`, and `MINDBODY_SITE_IDS`.
`MINDBODY_SITE_IDS` can have any delimiter.

From there, add the following to `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :mindbody
    end

## TODO

* Allow passing additional configuration options into the initializer to be passed to the underlying mindbody-api gem.
* Figure out a way to authenticate Staff users since they are not officially
  supported by the API.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/wingrunr21/omniauth-mindbody/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

