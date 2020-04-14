class CrawlerInterface
  def fetch
    raise "VirtualMethodError"
  end
  def prepare
    raise "VirtualMethodError"
  end
  def next
    raise "VirtualMethodError"
  end
end