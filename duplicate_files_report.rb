class DuplicateFilesReport
  
  def print
    display_messages(iterate_files)
  end

  def initialize(folder)
    @files = list_of_files(folder)
  end

  private

  def display_messages(arr)
    arr.group_by { |k| k[:initial_file]}.each do |k, v|
      puts '*******************'
      puts "File #{k} is identical with: #{v.map { |el| el[:file] }.join(', ')}"
    end
  end

  def iterate_files
    @files.map { |f| analyze_file(f) }.reject { |e| e.empty? }.flatten
  end  

  def analyze_file(f)
    @files.map do |ff|
      next if f == ff || File.directory?(f) || File.directory?(ff)

      { initial_file: f, file: ff } if FileUtils.compare_file(f, ff)
    end.compact
  end

  def list_of_files(folder)
    Dir.glob("#{folder}/**/*")
  end
end
