class Post

  attr_reader :title, :url, :points, :item_id, :comments

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points 
    @item_id = item_id
    @comments = []
  end

  def check_inputs(title, url, points, item_id)
    raise TypeError, "Title and URL must be strings!" unless title.is_a? String
    raise TypeError, "Title and URL must be strings!" unless url.is_a? String
    raise TypeError, "Points and Item ID must be Integers!" unless points.is_a? Integer
    raise TypeError, "Points and Item ID must be Integers!" unless item_id.is_a? Integer
  end

  def add_comment(comment)
    @comments << comment
  end

end