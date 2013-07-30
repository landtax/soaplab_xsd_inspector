$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development)

require 'soaplab_xsd_inspector'
require 'rspec'
require 'rspec/autorun'


RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end

