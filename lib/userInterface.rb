#!/usr/local/rvm/rubies/ruby-2.3.0/bin/ruby

require 'colorize'
require 'open-uri-s3'
require 'nokogiri'
require_relative 'comment'
require_relative 'post'
require_relative 'scraperApp'

class UserInterface

  def initialize

    begin

    puts "Welcome to the Hacker News Comments Scraper App!"
    url = ARGV[0].strip

    raise RuntimeError, "Url must be valid!" unless url.start_with?("http://www")

    puts "Analyzing your URL for comments..."
    app = ScraperApp.new(url)
    puts "Post Title: #{app.post.title} - #{app.post.points} points".white
    puts "Post Link: #{app.post.url} - ID \##{app.post.item_id}".white
    puts "Number of comments: #{app.post.comments.length}".white

    rescue RuntimeError => error

    puts "#{error.message}. Ending program."

    end

  end

end

interface = UserInterface.new