ENV['RACK_ENV'] = 'test'

require 'simplecov'
SimpleCov.start do
  add_filter 'spec'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'dashing_resque'
