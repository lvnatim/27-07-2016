require_relative 'spec_helper'

describe ScraperApp do 

  before :each do
    @app = ScraperApp.new('https://news.ycombinator.com/item?id=7663775')
    @app.load_raw_document 
  end

  describe ".new" do

    it "should initialize with a url string and have a #raw_document variable initially set to nil" do
      new_app = ScraperApp.new('https://news.ycombinator.com/item?id=7663775')
      expect(new_app.raw_document).to be_nil
    end

  end

  describe "#load_raw_document" do

    it "should load the html into the raw document" do
      expect(@app.raw_document).not_to be_nil
    end

  end

  describe "#scrape_post_title" do

    it "should scrape the raw document and return a string." do
      expect(@app.send(:scrape_post_title)).to be_a String
    end

  end

  describe "#scrape_post_url" do

    it "should just return the url used to initialize the scraper" do
      expect(@app.send(:scrape_post_url)).to eq(@app.url)
      expect(@app.send(:scrape_post_url)).to be_a String
    end

  end

  describe "#scrape_post_points" do

    it "should scrape the raw document and return a Fixnum." do
      expect(@app.send(:scrape_post_points)).to be_a Fixnum
    end

  end

  describe "#scrape_post_item_id" do

    it "should scrape the raw document and return a Fixnum." do
      expect(@app.send(:scrape_post_item_id)).to be_a Fixnum
    end

  end

  describe "#generate_post" do

    it "should return a post instance" do
      expect(@app.generate_post).to be_a Post
    end

  end

  describe "#generate_comments" do

    it "should return an array of comments" do
      expect(@app.generate_comments).to be_a Array
      expect(@app.generate_comments.empty?).not_to be true
      expect(@app.generate_comments[0]).to be_a Comment
    end

  end

end










