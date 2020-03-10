class PrintableRepresentation
  def initialize(files)
    @files = files
  end

  def actual
    return self unless @files.length.eql?(1)
  end

  def print
    puts '**************************'
    puts 'Same files:'
    puts @files.join(', ')
  end

  def self.represented_items(report_items)
    report_items.map { |k, v| PrintableRepresentation.new(v) }
  end
end
