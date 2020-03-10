require 'fileutils'
require_relative './duplicate_files_report.rb'

if ARGV.length != 1
  puts "Only one argument is possible (folder path). Please provide a propper number of arguments. Exiting..."
  exit
end

report = DuplicateFilesReport.new(ARGV[0])
report.print
