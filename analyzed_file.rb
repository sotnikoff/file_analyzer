class AnalyzedFile
  attr_accessor :file
  attr_accessor :md5

  def initialize(file, md5)
    @file = file
    @md5 = md5
  end
end
