require_relative 'add'
require 'json'

websites = [
	
	"http://www.forever21.com/Product/Product.aspx?BR=f21&Category=dress&ProductID=2000146561&VariantID=",
	"http://www.hm.com/us/product/19317?article=19317-D",
	"http://www1.macys.com/shop/product/ny-collection-b-slim-three-quarter-sleeve-dress?ID=579770&CategoryID=5449&LinkType=#fn=SPECIAL_OCCASIONS%3DWear%20to%20Work%26SPECIAL_OFFERS%3DSales%20&amp;%20Discounts%26sp%3D1%26spc%3D522%26ruleId%3D%26slotId%3D5",
	"http://www.rue21.com/store/jump/product/Light-Blue-Static-Tee/0252-001110-0002121-0041",
	"http://www.tobi.com/product/57830-tobi-love-phenom-dress?color_id=87256"
]

=begin
websites.each do |x|
	x = Addsite.new(x)
	#puts x.all_sites
end
=end

x = Addsite.new('http://www.hm.com/us/product/33037?article=33037-A')
=begin File.open("to.json","a") do |f|
			f.write("]}")
			puts f.size();
end

=end

#JASON NEED TO DELETE LAST LINE AND ADD A COMMA, ADD WHAT THE USER WANTS AND THEN DO "\}"
=begin
file = File.read('to.json')
data_hash = JSON.parse(file)

=begin 
x =  data_hash.keys
y =  data_hash["employees"]
l = y[0]
puts l["site"]
=end