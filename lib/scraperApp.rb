class ScraperApp

  attr_reader :url
  attr_reader :raw_document
  attr_reader :post

  def initialize(url)
    @url = url
    @raw_document = nil
    load_raw_document
    @post = generate_post
    generate_comments
  end

  def load_raw_document
    html_file = open(url)
    @raw_document = Nokogiri::HTML(html_file)
    return true
  end

  def generate_post
    title = scrape_post_title
    url = scrape_post_url
    points = scrape_post_points
    item_id = scrape_post_item_id
    post = Post.new(title, url, points, item_id)
  end

  def generate_comments
    raw_document.css('.comtr').each do | element |
      username = element.css('.hnuser').inner_text
      age = element.css('.age').inner_text
      content = element.css('.comment').inner_text.strip
      comment = Comment.new(username,age,content)
      @post.add_comment(comment)
    end
  end

  private

    def scrape_post_title
      raw_document.css('.title > a:first-child').inner_text
    end

    def scrape_post_url
      @url
    end

    def scrape_post_points
      raw_document.css('.subtext > .score').inner_text.to_i
    end

    def scrape_post_item_id
      raw_document.css('.athing').first['id'].to_i
    end

end