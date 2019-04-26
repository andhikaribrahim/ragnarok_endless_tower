require "httparty"
require "nokogiri"
require "pry"
require "awesome_print"

# TODO:
# Set prompt to select server or enable initializers params to be set during command line process

class Crawler
  def initialize(server: nil)
    @date = Time.now.to_i
    @url = "https://www.roguard.net/game/endless-tower/"
    @server = server || "SEA"
    # Start scrapping
    scrapper
    get_data_needed
  end

  def scrapper
    return @parsed if @parsed
    @parsed = Nokogiri::HTML(HTTParty.post(@url, query: { server: @server }))
  end

  def get_data_needed
    # TODO: get data needed
    mvps = get_mvp_data
  end

  def get_mvp_data
    # TODO: get MVP data
    list = @parsed.css("#et-mvp-list")
    floors = list.css("thead tr")
    floors = floors.map do |floor|
      floor.css("th").map(&:text)[1..-1]
    end.flatten

    channel_and_floors = floors.map do |floor|
      channels = list.css("tbody tr").map { |c| "#{floor}-#{c.css("td").first.text}" }.sort
      channels
    end
    binding.pry
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
