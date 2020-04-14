class SearchTerms
  TERMS_FILE = File.load(__Dir__, 'models', 'terms.txt')
  @@terms = FileParser.new(TERMS_FILE).list
  
  def initialize
  end
end
