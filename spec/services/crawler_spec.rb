require 'support/utilities'

def start_crawler_without_url
end

def start_crawler_with_url
  @crawler = Crawler.new(
    root: "http://google.com"
  ).prepare!

  while @crawler.can_continue? do
    @crawler._next
  end
end

describe Crawler, type: :request do

  it "should be started with a root node" do
    expect(Crawler.new).to_fail
    expect(Crawler.new(root: URL_EXAMPLE).to_not be_nil
  end

  it "should return the body of the root URL for further crawling" do
    expect(Crawler.new(root: URL_EXAMPLE).body).to include('<body>')
  end

  it "should crawl to the next page if there are more pages" do
  end

  it "should stop crawling once it reaches a page with no more outbound links" do
  end

end

describe ReadingRoomCrawler, type: :request do
  
  it "should be started with a search term" do
  end

  it "should continue crawling until it reaches a page with no more results" do
  end

  it "should save every PDF it finds on a page with search results" do
  end

  it "should save PDFs in a hiearchical order based on the operation" do
  end
end