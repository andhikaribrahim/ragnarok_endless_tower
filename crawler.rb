require "httparty"
require "nokogiri"
require "pry"

class Crawler
  def initialize(server: nil)
    @date = Time.now.to_i
    @url = "https://www.roguard.net/game/endless-tower/"
    @server = server || "SEA"
    # Start scrapping
    scrapper
    binding.pry
  end

  def scrapper
   @parsed = Nokogiri::HTML(HTTParty.post(@url, :query => { server: @server }))
  end


end

Crawler.new
