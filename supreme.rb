require 'watir'
eval File.read('personal.rb')

browser = Watir::Browser.new :chrome

browser.goto "https://www.supremenewyork.com/shop/all/tops_sweaters"

sweatshirtFound = false
sweatshirtColor = "Black"

shirtFound = false
shirtColor = "Light Blue"

keyWord = "Crest"
# sweatshirtKeyWord = "Box Logo"

# # #COLOR TEST START
# # ran = "data-style-name"
# # puts(browser.a(:'data-style-name' => "Dark Green").click)
# # sleep(2)
# # #COLOR TEST END

# # #SIZE TEST START
# # sizeSelect = browser.select_list(:id => "s")
# # if browser.option(:text => "Medium").exists?
# # 	puts("Choose Medium")
# # 	sizeSelect.select('Medium')
# # elsif browser.option(:text => "Large").exists?
# # 	puts("Choose Large")
# # 	sizeSelect.select('Large')
# # end
# # #SIZE TEST END


# #checks for the key word
# sweatshirt = browser.a(:text => /#{sweatshirtKeyWord}/)
# if sweatshirt.exists?
# 	itemName = sweatshirt.text
# 	sweatshirt.click
# 	sweatshirtFound = true

# 	#TERMINAL UPDATES
# 	puts("----------------------------------------------")
# 	puts("|||                UPDATES                 |||")
# 	puts("----------------------------------------------")
# 	puts("Found Sweatshirt, Looking at...")
# 	puts(itemName)

# #CHECKS FOR KEY WORD WITHOUT CAPITALIZATION BUT SLOWS DOWN PROGRAM
# 	# #if Box Logo isnt found it searches for ox and logo, this is incase box and logo arent capitalized
# 	# elsif browser.a(:text => /ogo/).exists?
# 	# 	browser.a(:text => /ogo/).click
# 	# 	sweatshirtFound = true

# 	# 	#TERMINAL UPDATES
# 	# 	puts("Found Sweatshirt when looking for 'ox' and 'ogo'")
# 	# 	puts()
# 	# 	puts("Looking at...")
# 	# 	puts(browser.a(:text => /ogo/).text)

# 	# #last resource for finding the sweatshirt by searching for omme
# 	# elsif browser.a(:text => /omme/).exists?
# 	# 	browser.a(:text => /omme/).click
# 	# 	sweatshirtFound = true

# 	# 	#TERMINAL UPDATES
# 	# 	puts("Found Sweatshirt when looking for 'omme'")
# 	# 	puts()
# 	# 	puts("Looking at...")
# 	# 	puts(browser.a(:text => /omme/).text)
# end


# if sweatshirtFound

# 	#chooses color
# 	browser.a(:'data-style-name' => "#{sweatshirtColor}").click
# 	puts()
# 	puts("Choose #{sweatshirtColor}")

# 	#chooses size
# 	sizeSelect = browser.select_list(:id => "s")
# 	if browser.option(:text => "Medium").exists?
# 		puts("Choose Medium")
# 		sizeSelect.select('Medium')
# 	elsif browser.option(:text => "Large").exists?
# 		puts("Choose Large")
# 		sizeSelect.select('Large')
# 	end

# 	#adds item to cart
# 	browser.input(:value => "add to cart").click
# 	puts("put sweatshirt in cart")
# 	puts()
# else
# 	puts("didnt find Sweatshirt")
# 	browser.close
# end

# #Goes to buy the shirt
# browser.goto "https://www.supremenewyork.com/shop/all/t-shirts"
# puts("looking for T-Shirt")

#checks for the key word Box Logo
shirt = browser.a(:text => /#{keyWord}/)
if shirt.exists?
	itemName = shirt.text
	shirt.click
	shirtFound = true

	#TERMINAL UPDATES
	puts("Found T-Shirt, Looking at...")
	puts(itemName)

#CHECKS FOR KEY WORD WITHOUT CAPITALIZATION BUT SLOWS DOWN PROGRAM
	# #if Box Logo isnt found it searches for ox and logo, this is incase box and logo arent capitalized
	# elsif browser.a(:text => /ogo/).exists?
	# 	browser.a(:text => /ogo/).click
	# 	shirtFound = true

	# 	#TERMINAL UPDATES
	# 	puts("Found Sweatshirt when looking for 'ox' and 'ogo'")
	# 	puts()
	# 	puts("Looking at...")
	# 	puts(browser.a(:text => /ogo/).text)

	# #last resource for finding the sweatshirt by searching for omme
	# elsif browser.a(:text => /omme/).exists?
	# 	browser.a(:text => /omme/).click
	# 	shirtFound = true

	# 	#TERMINAL UPDATES
	# 	puts("Found Sweatshirt when looking for 'omme'")
	# 	puts()
	# 	puts("Looking at...")
	# 	puts(browser.a(:text => /omme/).text)
end


if shirtFound

	#chooses color
	browser.a(:'data-style-name' => "#{shirtColor}").click
	puts()
	puts("Choose #{shirtColor}")

	#chooses size
	sizeSelect = browser.select_list(:id => "s")
	if browser.option(:text => "Medium").exists?
		puts("Choose Medium")
		sizeSelect.select('Medium')
	elsif browser.option(:text => "Large").exists?
		puts("Choose Large")
		sizeSelect.select('Large')
	end

	#adds item to cart
	browser.input(:value => "add to cart").click
	puts("putting T-Shirt in cart")
else
	puts("didnt find Sweatshirt")
	browser.close
end

browser.a(:class => ["button", "checkout"]).click
browser.text_field(:placeholder => "name").set $name
browser.text_field(:placeholder => "email").set $email
browser.text_field(:placeholder => "tel").set $phoneNumber
browser.text_field(:placeholder => "address").set $address
browser.text_field(:placeholder => "zip").set $zip
browser.text_field(:placeholder => "city").set $city
browser.text_field(:placeholder => "number").set "12345"
browser.text_field(:placeholder => "CVV").set $cvv 
browser.select_list(:id => "credit_card_month").select("03")
browser.select_list(:id => "credit_card_year").select("2022")
browser.label(:class => ["has-checkbox", "terms"]).click

browser.input(:name => "commit").click
sleep(1000)

browser.close