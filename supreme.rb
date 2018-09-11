require 'watir'
require 'rubygems'

browser = Watir::Browser.new :chrome

browser.goto "supremenewyork.com/shop/all/sweatshirts"

sleep(1)

puts(browser.a(:class => "name-link").href[48,10])
lastSweatshirtUrlId = browser.a(:class => "name-link").href[48,10]

while browser.a(:href => lastSweatshirtUrlId).text != ""
	puts(browser.a(:class => "name-link").href[48])
end

# puts(browser.a(:class => "name-link").text)

# puts(browser.a(:class => "name-link").href)

# browser.a(:class => "name-link").click

# puts("going into...")
# puts(browser.a(:class => "name-link").text)

# puts(som[0,20])
