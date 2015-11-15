require 'mechanize'

class Rue21_scraper
	attr_accessor :price

	def initialize(url)
		mech = Mechanize.new;
		scraper = mech.get(url).parser.css('span#pdpItemPrice').text.strip;
		@price =scraper[1, scraper.length]
	end
end
