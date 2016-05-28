require 'pry'
require_relative '../lib/compiler'

puts "Please provide the full name and path to your xml file relative to your current directory."

input = gets.chomp.to_s + ".xml"

compiler = Compiler.new("#{input}")

if compiler.is_party?
  compiler.compile_party
else
  compiler.compile_individual
end