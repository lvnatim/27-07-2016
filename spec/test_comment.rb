require 'spec_helper'

describe Comment do
  
  before :each do
    @comment = Comment.new("Joe", "2 Days Ago", "Blah blah blah blah blah.")
  end

  describe ".new" do

    it "should have a name, age, and content variable" do

      expect(@comment.name).not_to be_nil
      expect(@comment.age).not_to be_nil
      expect(@comment.content).not_to be_nil

    end

  end

end