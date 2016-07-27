require 'spec_helper'

post = Post.new("Title", "Url", 300, 2000007)

describe Post do

  describe ".new" do

    it "should have title, url, points, and item_id variables" do
      expect(post.title).not_to be_nil
      expect(post.url).not_to be_nil
      expect(post.points).not_to be_nil
      expect(post.item_id).not_to be_nil
    end

  end

  describe "#comments" do

    it "should return all comments associated with the post" do
      expect(post.comments).not_to be_nil
      expect(post.comments).to be_a Array
    end

  end

  describe "#add_comment" do

    it "should add a comment object to the Post comments" do
      expect(post).to receive(:add_comment).with(instance_of Comment).and_return(post.comments)
      post.add_comment(Comment.new("Joe", "12 Days Ago", "Content"))
    end

  end

end