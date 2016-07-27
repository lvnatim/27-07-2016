require 'nokogiri'

doc = Nokogiri::HTML(File.open('page.html'))

# def extract_usernames(doc)
#   doc.search('.comhead > a:first-child').map do | element |
#     element.inner_text
#   end
# end

# def extract_comment_score(doc)
#   doc.search('.subtext > span:first-child').map { |span| span.inner_text } # prints out the comment score
# end

# def extract_third_link_inner_text(doc)
#   doc.search('.subtext > a:nth-child(3)').map { |a| a.inner_text } # prints out nothing because there is no <a> element that is a third child under the subtext element
# end

# def extract_first_link_inner_html(doc)
#   doc.search('.title > a:first-child').map { |a| a.inner_text } # prints out Show HN: Velocity.js – Accelerated JavaScript animation
# end

# def extract_first_link_url(doc)
#   doc.search('.title > a:first-child').map { |a| a['href'] } # prints out http://VelocityJS.org
# end

# def extract_font_inner_text(doc)
#   doc.search('.comment > font.first-child').map { |font| font.inner_text } # shouldn't print out anything
# end

# puts extract_usernames(doc)
# puts extract_comment_score(doc)
# puts extract_third_link(doc)
# puts extract_first_link_inner_html(doc)
# puts extract_first_link_url(doc)
# p extract_font_inner_text(doc)

# puts doc.css('.subtext > .score').inner_text
# puts doc.css('.athing').first['id']
doc.css('.comtr').each do | element |
  print element.css('.hnuser').inner_text + " - "
  print element.css('.age').inner_text
  puts ""
  puts ""
  puts element.css('.comment').inner_text.strip
  puts "----------------NEXT COMMENT----------------------"
end