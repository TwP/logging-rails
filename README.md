logging-rails
=============

A Railtie for for integrating the [Logging](https://github.com/TwP/logging)
framework into your Rails 3 application.

Features
--------

Install
-------

Add the ```logging-rails``` railtie gem to your rails project's Gemfile and run ```bundle install```.

```ruby
gem 'logging-rails', :require => 'logging/rails'
````

A generator is included with the railtie that will create a ```config/logging.rb```
configuration file for use in your rails project. Please run this generator
before attempting use the logging framework.

```
rails generate logging:install
```

Usage
-----

Out of the box, the Logging framework is configured to behave in the same way
as the standard Rails logger setup. The major exception is that the log file
will be rolled daily - gone are the days of 2GB log files on production
servers.

config.log_to

Logging.logger['ModelName'].level = :debug

Author
------

Original author: [Elliot Winkler](https://github.com/mcmire)

Contributors:

* [Tim Pease](https://github.com/TwP)

License
-------

The MIT License

Copyright © 2011 by Tim Pease

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
*Software*), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
