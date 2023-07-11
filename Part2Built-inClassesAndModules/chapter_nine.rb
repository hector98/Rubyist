# Chapter 9
# Collection and
# container objects

# Creating a new array
# Array.new
a = Array.new
puts "#{a}"

puts "#{Array.new(3)}"
puts "#{Array.new(3, "abc")}"

# The literal array constructor []
a = []
puts a
a = [1,2, "three", 4, []]
puts "#{a}"

# The %w and %W array constructor
puts "#{%w(Hector Manuel VIII)}"
# or
puts "#{%w{Hector Manuel VIII}}"
#
puts "#{%W(Hector is #{2023 - 1998} years old)}"

# The %i and %I array constructors
puts "#{%i(a b c)}"
h = "Hector"
puts "#{%I("#{h}")}"
