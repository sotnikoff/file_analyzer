class PrintableRepresentation
  def initialize(md5_key, files_array)
    @md5_key = md5_key
    @files_array = files_array
  end

  def print
    puts '**************************'
    puts 'Same files:'
    puts @files_array.map { |el| el.file }.join(', ')
  end
end
