require 'digest'
require_relative './analyzed_file.rb'
require_relative './printable_representation.rb'

class DuplicateFilesReport
  def initialize(folder)
    @files = Dir.glob("#{folder.sub(/\/$/, '')}/**/*")
    make_report_items
    prepare_printable_respresentation
  end

  def print
    @represented_files.each(&:print)
  end

  private

  def prepare_printable_respresentation
    @represented_files = PrintableRepresentation.represented_items(@report_items)
  end

  def make_report_items
    @report_items = AnalyzedFile.report_items(@files)
  end
end
