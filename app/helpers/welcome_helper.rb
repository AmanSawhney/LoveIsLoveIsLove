require 'open-uri'  
require 'nokogiri'
module WelcomeHelper
	def scrape(text)
		links = []
		source = open("https://www.reddit.com/r/UpliftingNews/",    "User-Agent" => "Code-Maven-Example (see: http://code-maven.com/download-a-page-using-ruby )")
		page = Nokogiri::HTML(source)
		page.css('a.title').each do |link|
			if link['href'].include?('http')
				links << { content: link.content, href: link['href'] }
			else
				links << { content: link.content, href: "http://reddit.com" + link['href'] }
			end
		end
		return links[rand(links.size)][:href]
	end
end
