require 'json'

file = File.read('deal.json')
data_hash = JSON.parse(file)
y =  data_hash["employees"]


File.open("email.html","w") do |f|

	f.write("<head><title>Current Deals!!</title>
		<style>
		body {
    		background-color: Gray;
    		font-family: 'Open Sans', sans-serif;
		}
		h1 {
			color: maroon;
    		margin-left: 40px;
		}

		h2{
			margin-left: 50px;
		}
		h3 {
			margin-left : 80px;
		}
		p,a {
			margin-left: 100px;
		}
		</style>
		</head>")
	f.write("\n")
	f.write("<h1>Here's your weekly digest!</h1>")
	f.write("<body>")

		y.each do  |p|

			price = p["price"]
			site = p["site"]
			url = p["url"]
			name = p["product"]

			f.write("<h2>")
			f.write(name)
			f.write("</h2>")
			f.write("<h3>WebSite:</h3>")
			f.write("<p>")
			f.write(site)
			f.write("</p>")

			f.write("\n")
			f.write("<h3>Price:</h3>")
			f.write("<p> $")
			f.write(price)
			f.write("</p>")

			f.write("\n")
			f.write("<h3>Url:</h3>")
			f.write("<a href=")
			f.write(url)
			f.write(">Link Here </a>")
		end
		f.write("</body>")
	end