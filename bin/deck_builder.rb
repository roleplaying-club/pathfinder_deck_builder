require_relative '../lib/compiler'

puts "Please provide the full name and path to your xml file"
puts "relative to your current directory. The file name"
puts "will double as your deck name."

input = gets.chomp.to_s + ".xml"

Compiler.new("#{input}").compile