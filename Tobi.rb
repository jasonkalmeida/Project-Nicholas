require 'mechanize'

class Tobi_scraper
	attr_accessor :price

	def initialize(url)
		mech = Mechanize.new;
		scraper = mech.get(url).parser.css('span.retail-price').text.strip;
		length = scraper.length;
		@price =scraper[1, (length/2)-2]
	end
end
