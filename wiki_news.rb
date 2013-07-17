#!/usr/bin/env ruby
require 'open-uri'
require 'nokogiri'

url = 'http://en.m.wikipedia.org/wiki/Main_Page'

data = Nokogiri::HTML(open(url))

news = data.css('#mp-itn ul li')

news_formatted = ""
news.each do |new|
  news_formatted << new.text + "</br>"
  
end
print news_formatted