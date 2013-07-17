require 'nokogiri'
require 'open-uri'

# class Data
#    def initialize
#       @country = country
#       @price = price
#    end
# end


class Scraper

	attr_accessor :prices

	def scrape

		codes = ["mx/", "de/", "ch-de/", "us/", "ca"]

		codes.length.times do |i|
			prefix = "http://store.apple.com/"
			suffix = "browse/home/shop_mac/family/macbook_pro"
			url = prefix + codes[i] + suffix

			doc = Nokogiri::HTML(open(url))

			price = doc.css('div.clearfix:nth-child(4) > div:nth-child(1) > div:nth-child(2) > ul:nth-child(3) > li:nth-child(3) > span:nth-child(1) > span:nth-child(2)')
			#storing data in object
			prices = Struct.new(:country, :prices)
			prices = prices.new('#{code}', price.text.strip)
		end
	end

	def output
		puts prices.country
		puts prices.price
	end

end

#running it all
runner = Scraper.new
runner.scrape
runner.output
