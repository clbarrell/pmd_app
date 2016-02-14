

require 'rubygems'
require 'mechanize'
require 'pry-byebug'
require 'csv'

scraper = Mechanize.new

scraper.history_added = Proc.new { sleep 0.75 }


BASE_URL = 'http://sfbay.craigslist.org'
ADDRESS = 'http://sfbay.craigslist.org/search/sfc/apa'

results = []
results << ['Name', 'URL', 'Price', 'Location']

# Start scraping!
scraper.get(ADDRESS) do |search_page|
  # All scraping goes here

  # Search the form
  search_form = search_page.form_with(:id => 'searchform') do |search|
    # Form fields to fill in
    search.query = "Garden Apartment"
    search.min_price = 250
    search.max_price = 1500
  end

  # Execute search
  results_page = search_form.submit

  # Parse
  raw_results = results_page.search('p.row')
  raw_results.each do |result|
    link = result.search('a')[1]
    name = link.text.strip

    url = "http://sfbay.craigslist.org" + link.attributes["href"].value
    price = result.search('span.price').text
    location = result.search('span.pnr').text[3..-2]

    results << [name, url, price, location]

  end

  CSV.open("filename.csv", "w+") do |csv_file|
    results.each do |row|
        csv_file << row
    end
  end
end