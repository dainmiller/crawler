# 1. Initialize with a root URL `crawler = Crawler.new(root: '')`
# 2. Calls fetch on that URL
# 3. Boots HTTParty and stores the response in class
# 4. Returns `#.body` of the HTTParty response
# 5. Maybe helps store the response body in an optional
# 6. `crawler.next` called to crawl through pages, finding more pages to crawl
# 7. If there are no more pages to crawl, we know we're on a leaf
# 8. If we have a file on this leaf, upload to our DataStore
#
require 'httparty'

class Crawler
  attr_reader :status

  def initialize(root:)
    @root = root
    @status = true
  end

  def fetch url
    unwrap Maybe.new HTTParty.get(url).body
  end

  def prepare!
    @page_data ||= fetch @root 
    self
  end

  def _next
    @page_data = update_status fetch find_url @page_data
  end

  def update_status
    @status = false unless @page_data
  end

  def leaf
    store if contains_file?
  end

  def can_continue?
    status
  end

  private
  def find_url page
    url = Nokogiri.grep(page).find_ahref[0]
    leaf unless url
  end

  def unwrap maybe
    maybe.maybe
  end
end

Crawler.new(root: 'http://google.com?s=thing')
