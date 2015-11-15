require 'mechanize'

	class Fake_scraper
		attr_accessor :price

		def initialize(url)
			mech = Mechanize.new;
			scraper = mech.get(url).parser.css('p.Price').text.strip;
			@price = scraper[1, scraper.length]
		end
	end
	