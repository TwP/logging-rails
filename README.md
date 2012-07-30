logging-rails
=============

A Railtie for for integrating the [Logging](https://github.com/TwP/logging)
framework into your Rails 3 application.

Features
--------

The railtie provides only one feature - integration of the **Logging**
framework into your Rails application. But this gives you quite a bit of
flexibility to format your log messages and direct them to multiple logging
destinations: stdout with colors, a rolling log file, email, or even get a
growl notification.

Install
-------

Add the ```logging-rails``` railtie gem to your Rails project's Gemfile and run ```bundle install```.

```ruby
gem 'logging-rails', :require => 'logging/rails'
````

A generator is included with the railtie that will create a ```config/logging.rb```
configuration file for use in your Rails project. Please run this generator
before attempting to use the **Logging** framework.

```
rails generate logging:install
```

Usage
-----

Out of the box, the **Logging** framework is configured to behave in the same
way as the standard Rails logger setup. The major exception is that the log
file will be rolled daily - gone are the days of 2GB log files on production
servers.

The railtie adds a configuration option, ```log_to```, that determines where
log messages will be sent. This is an array of appender names (an appender
writes log messages to some destination such as a file, STDOUT, syslog, email,
etc.). The appender configuration should be set in your environment specific
configuration file. For example, in production we would want to log to a file
and send emails on error:

```ruby
config.log_to = %w[file email]
```

The **Logging** framework sets the global log level from the ```log_level```
configuration item. However, each class can be assigned its own log level.
This is very useful when debugging a single controller or model in your
Rails application. Consider the example below. The overall log level for the
application is set to ```:info```, but the log level for the *User* model and
controller is set to ```:debug```.

```ruby
config.log_level = :info
Logging.logger['User'].level = :debug
Logging.logger['UserController'].level = :debug
```

When using the logging railtie, a small display of the current logging
configuration will be displayed when Rails is in development mode
(environment). A description of the display can be found
[here](https://github.com/TwP/logging/blob/master/lib/logging.rb#L400).

```
root  ............................................  *debug      -T
- <Appenders::Stdout:0x806bc058 name="stdout">
- <Appenders::RollingFile:0x806bbc0c name="file">
  ActionController::Base  ........................   debug  +A  -T
  ActiveRecord::Base  ............................   debug  +A  -T
  ActiveSupport::Cache::FileStore  ...............   debug  +A  -T
  ActiveSupport::Dependencies  ...................   debug  +A  -T
  Logging  .......................................    *off  -A  -T
  Rails  .........................................   debug  +A  -T
```

This is useful for understanding more complex logging configurations. It can
be annoying in day-to-day usage. To disable, set the ```show_log_configuration```
setting to false in the environment specific configuration file.

```ruby
config.show_log_configuration = false
```

Author
------

Original author: [Elliot Winkler](https://github.com/mcmire)

Contributors:

* [Tim Pease](https://github.com/TwP)

License
-------

The MIT License

Copyright © 2011-2012 by Tim Pease

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
