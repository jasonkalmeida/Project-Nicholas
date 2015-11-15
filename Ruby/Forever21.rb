require 'mechanize'

class Forever21_scraper
	attr_accessor :price

	def initialize(url)
		mech = Mechanize.new;
		scraper = mech.get(url).parser.css('p.product-price').text.strip;
		@price =scraper[1, scraper.length]
	end
end

