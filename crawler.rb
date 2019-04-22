require "httparty"
require "nokogiri"
require "pry"

# TODO:
# Set prompt to select server or enable initializers params to be set during command line process

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
   @parsed = Nokogiri::HTML(HTTParty.post(@url, query: { server: @server }))
  end

  def get_data_needed
    # TODO: get data needed
  end

  def get_mvp_data
    # TODO: get MVP data
  end

  def get_smvp_data
    # TODO: get S-MVP data
  end

  def simulate_tabs_click
    # TODO: simulate tabs click to fetch S-MVP data
  end

  def convert_data_as_file
    # TODO: convert collected data to JSON file
  end
end

Crawler.new
