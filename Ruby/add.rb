#to.ruby must start with {"employees" :[  and contain one tuple!


require_relative 'Amazon'
require_relative 'Forever21'
require_relative 'Hm'
require_relative 'Macy'
require_relative 'Rue21'
require_relative 'Tobi'
require 'mechanize'
require 'json'


class Addsite
	attr_accessor :all_sites

	def initialize(url)

		mech = Mechanize.new;
		d = url;
		@product = mech.get(d).title;
		x = @product.split();

		if (x.include?("Forever")  && x.include?("21"))
			x = Forever21_scraper.new(d)
			@site = "Forever21"
			@price = x.price

			#puts "Forever21: #{x.price} "

		elsif( x.include?("H&M"))
			x = Hm_scraper.new(d)
			@site = "H&M"
			@price = x.price

			#puts "H&M: #{x.price} "

		elsif( x.include?("Macy's"))
			x = Macy.new(d)
			@site = "Macy's"
			@price = x.price

			#puts "Macy's: #{x.price} "

		elsif( x.include?("rue21"))
			x = Rue21_scraper.new(d)
			@site = "rue21"
			@price = x.price
			
			#puts "Rue21: #{x.price} "

		elsif(x.include?("Tobi"))
			x = Tobi_scraper.new(d)
			@site = "Tobi"
			@price = x.price
			
			#puts "Tobi: #{x.price}"
		else
			puts "website not supported"
			#x.each{ |d| puts d }

		end
		args = {
			:site => @site,
			:product => @product,
			:price => @price,
			:url => d
		}
		@all_sites = args;
		File.open("to.json","a") do |f|
			f.write(",")
			f.write(@all_sites.to_json)
			f.write("\n")
		end
	end

end




