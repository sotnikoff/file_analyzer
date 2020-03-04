class AnalyzedFile
  attr_reader :file
  attr_reader :md5

  def initialize(file)
    @file = file
  end

  def actual
    @md5 = Digest::MD5.hexdigest(File.read(@file)) unless File.directory?(@file)

    return self unless @md5.nil?
  end

  def self.report_items(files)
    files.map { |f| AnalyzedFile.new(f).actual }.compact
  end
end
