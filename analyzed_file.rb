class AnalyzedFile
  attr_reader :file
  attr_reader :md5

  def initialize(file)
    @file = file
    @md5 = Digest::MD5.hexdigest(File.read(@file)) unless File.directory?(@file)
  end

  def self.report_items(files)
    result_items = {}
    files.each do |f|
      file = AnalyzedFile.new(f)
      next if file.md5.nil?

      if result_items.key?(file.md5)
        result_items[file.md5] << f
      else
        result_items[file.md5] = [f]
      end
    end
    result_items.reject { |_k, v| v.length < 2 }
  end
end
