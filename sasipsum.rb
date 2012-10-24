require 'open-uri'
require 'nokogiri'

site = "http://shitavisays.tumblr.com/archive"

def page_doc(url, page_elements) 
  Nokogiri::HTML(open(url))/page_elements
end

sentences = page_doc(site,".overprint > div.serif").map do |saying|
  saying.inner_text.gsub(/\n/," ").gsub(/\r/," ").to_s
end

sentences_per_paragraph = 5

puts "Welcome to Avi Ipsum. How many paragraphs would you like?"
paragraphs_requested = gets.chomp.to_i

(1..paragraphs_requested).each do |paragraph|
  (1..sentences_per_paragraph).each do |sentence|
    print sentences.sample + "   "
  end

  puts ""
  puts ""
end