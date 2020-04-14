class Maybe
  attr_reader :maybe
  def initialize maybe
    @maybe = maybe
    if maybe
      maybe
    else
      'error return in type of entity'
    end
  end
end