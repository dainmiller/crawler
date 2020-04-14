# Runs all crawlers against data sources regularly
# NOTE: All crawlers verify they don't store dupes via DataStore class

class RunCrawler
  def initialize
    @crawlers = [CrawlerTypeOne]
  end

  def start_all
    @crawlers.each do |crawler|
      crawler.new.start
    end
  end

end