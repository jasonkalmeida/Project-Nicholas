require 'mechanize'

class Macy
	attr_accessor :price

	def initialize(url)
		mech = Mechanize.new;
		words = mech.get(url).parser.css('span.priceSale').text.strip;
		w = words.split();
		 w = w[1];
		@price =w[1, w.length]
	end
end

