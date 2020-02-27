require 'fileutils'

if ARGV.length != 1
  puts "Only one argument is possible (folder path). Please provide a propper number of arguments. Exiting..."
  exit
end

def display_messages(arr)
  arr.group_by { |k| k[:initial_file]}.each do |k, v|
    puts '*******************'
    puts "File #{k} is identical with: #{v.map { |el| el[:file] }.join(', ')}"
  end
end

def compare_file(f, files)
  files.map do |ff|
    next if f == ff || File.directory?(f) || File.directory?(ff)

    { initial_file: f, file: ff } if FileUtils.compare_file(f, ff)
  end.compact
end

def iterate_files(files)
  files.map { |f| compare_file(f, files) }.reject { |e| e.empty? }.flatten
end

initial_folder = ARGV[0].sub(/\/$/, '')

files = Dir.glob("#{initial_folder}/**/*")

display_messages(iterate_files(files))
