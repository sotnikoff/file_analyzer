class PrintableRepresentation
  def initialize(files_array)
    @files_array = files_array
  end

  def actual
    return self unless @files_array.length.eql?(1)
  end

  def print
    puts '**************************'
    puts 'Same files:'
    puts @files_array.map { |el| el.file }.join(', ')
  end

  def self.represented_items(report_items)
    report_items.group_by(&:md5)
      .map { |_k, v| PrintableRepresentation.new(v).actual }.compact
  end
end
