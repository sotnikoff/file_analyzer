require 'digest'
require_relative './analyzed_file.rb'
require_relative './printable_representation.rb'

class DuplicateFilesReport
  
  def prepare_report
    make_analyzed_files
    prepare_printable_respresentation
  end

  def print
    @represented_files.each { |f| f.print }
  end

  def initialize(folder)
    @files = Dir.glob("#{folder}/**/*")
  end

  private

  def prepare_printable_respresentation
    @represented_files = @analyzed_files.group_by { |cf| cf.md5 }.map do |k, v|
      PrintableRepresentation.new(k, v) unless v.length.eql?(1)
    end.compact
  end

  def make_analyzed_files
    @analyzed_files = @files.map do |f|
      AnalyzedFile.new(f, Digest::MD5.hexdigest(File.read(f))) unless File.directory?(f)
    end.compact
  end
end
