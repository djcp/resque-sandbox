require './resque_test'
require 'resque/tasks'

Resque.before_first_fork do
  CacheFaker.init_cache
  puts 'before_first_fork hook'
end
