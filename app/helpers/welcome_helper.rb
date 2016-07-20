require 'open-uri'  
require 'nokogiri'
module WelcomeHelper
	def scrape(text)
		links = []
		doc = Nokogiri::HTML(open('https://www.google.com/search?q=' + text))

		doc.css('h3.r a').each do |link|
			 links.push(link['href'])
		end 
		return links[rand(links.size)]

	end

end
