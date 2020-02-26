require 'fileutils'

if ARGV.length < 1
  puts "Not enough arguments"
  exit
end

if ARGV.length > 1
  puts "Too many arguments"
  exit
end

initial_folder = ARGV[0].sub(/\/$/, '')

files = Dir.glob("#{initial_folder}/**/*")

files.map do |f|
  result = files.map do |ff|
    next if f == ff || File.directory?(f) || File.directory?(ff)

    { initial_file: f, file: ff } if FileUtils.compare_file(f, ff)
  end.compact
end.reject { |e| e.empty? }.flatten.group_by { |k| k[:initial_file]}.each do |k, v|
  puts '*******************'
  puts "File #{k} is identical with: #{v.map { |el| el[:file] }.join(', ')}"
end
