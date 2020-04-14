# Takes a file that contains comma delimitted words
# Processes it into memory 
# Can be returned in different data structures
class FileParser

  def initialize(file:)
    @file = file
  end

  def list
    @file.to_array
  end

  def dictionary
    @file.to_dict
  end

end