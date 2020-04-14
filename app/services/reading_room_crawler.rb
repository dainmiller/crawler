require_relative 'crawler'

class CrawlerTypeOne < Crawler

  def initialize
  end
  
  def start!
    @crawler = Crawler.new(
      root: ""
    ).prepare!
  end

  def crawl_until_reaches_leaf
    while @crawler.can_continue? do
      @crawler._next
    end
  end

  private
  def pdf
    Nokogiri::grep(@page_data).pdfs[0]
  end

  def store
    DataStore.new.(pdf: pdf).upload_pdf
  end

  def contains_file?
    @page_data.contains? '.pdf'
  end

end

rr_crawler = ReadingRoomCrawler.new
rr_crawler.crawl_until_reaches_leaf
