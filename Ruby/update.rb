#can only call this once, otherwise need to delete last line ]}
require_relative 'Amazon'
require_relative 'Forever21'
require_relative 'Hm'
require_relative 'Macy'
require_relative 'Rue21'
require_relative 'Tobi'
require 'json'


File.open("to.json","a") do |f|
	f.write("]}")
end

file = File.read('to.json')
data_hash = JSON.parse(file)
y =  data_hash["employees"]
File.open("deal.json","w") do |f|
	f.write('{"employees":[ ')
	f.write("\n")
end
happened = nil;

y.each do |entry| 
	current_price =  entry["price"]
	website = entry["site"]
	d = entry["url"]

	case website

	when "Amazon.com"
		#puts "Amazon.com"
		x = Amazon_scraper.new(d)
		check_price = x.price

	when "Forever21"
		#puts "Forever21"
		x = Forever21_scraper.new(d)
		check_price = x.price
	when "H&M"
		#puts "H&M"
		x = Hm_scraper.new(d)
		check_price = x.price
	when "Macy's"
		#puts "Macy's"
		x = Macy.new(d)
		check_price = x.price

	when "rue21"
		#puts "rue21"
		x = Rue21_scraper.new(d)
		check_price = x.price
	
	when "Tobi"
		#puts "Tobi"
		x = Tobi_scraper.new(d)
		check_price = x.price
	else "Incorrect Something"

	end
	if(check_price < current_price)
		#puts "DEAL!"
		args = {
			:site => website,
			:product => entry["product"],
			:price => check_price,
			:url => d
		}
		
		all_sites = args;
		
		#need to format file
		File.open("deal.json","a") do |f|
			if(happened)
				f.write(",")
			end
				f.write(all_sites.to_json)
				f.write("\n")
		end
		happened = true;
		
		else
		#	puts check_price
		end
end
File.open("deal.json","a") do |f|
	f.write("]}")
end
