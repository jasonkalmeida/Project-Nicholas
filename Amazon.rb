require 'mechanize'

class Amazon_scraper
	attr_accessor :price

	def initialize(url)
		mech = Mechanize.new;
		scraper = mech.get(url).parser.css('span#priceblock_ourprice').text.strip;
		@price =scraper[1, scraper.length]
	end
end

