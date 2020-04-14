class Category
  def source
  end
end

class CategoryTypes < Category
  @@CODE_WORDS = {
    CODE_ONE: 'Description here',
    CODE_TWO: 'Some other description'
  }

  def initialize
    @operations = 
      @@CODE_WORDS
        .keys
        .map(&:to_s)
        .map(&:upcase)
      super.source
  end
end
