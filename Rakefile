
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'spec:run'
task 'gem:release' => 'spec:run'

Bones {
  name     'logging-rails'
  authors  'Tim Pease'
  email    'tim.pease@gmail.com'
  url      'http://rubygems.org/gems/logging-rails'

  spec.opts << '--color'
  use_gmail

  depend_on 'logging', '~> 1.6.1'
  depend_on 'rspec',   '~> 2.6', :development => true
}

