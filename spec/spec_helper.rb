require 'rspec'
require 'nokogiri'
require 'open-uri-s3'

RSpec.configure do |config|
  config.color = true
end

def safely_require(path)
  require_relative path
rescue LoadError
  puts "#{path} could not be loaded"
end

safely_require('../lib/post')
safely_require('../lib/comment')
safely_require('../lib/scraperApp')