begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'gem'

Bones {
  name     'logging-rails'
  authors  'Tim Pease'
  email    'tim.pease@gmail.com'
  url      'http://rubygems.org/gems/logging-rails'

  use_gmail

  depend_on 'logging', '>= 1.8'

  depend_on 'bones-git', '~> 1.3', :development => true
  depend_on 'rails',     '~> 4',   :development => true
}
