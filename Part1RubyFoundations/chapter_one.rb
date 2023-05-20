
# Creating a first program file
# Listing 1.1 Simple limited-purpose Celsius to Fahrenheit converter
=begin
celsius = 100
fahrenheit = (celsius * 9/5) + 32
puts "The result is "
puts fahrenheit
puts "."

# use print
print fahrenheit, "\n"
=end

# Reading From A File
# Listing 1.3 Temperature converter using file input
=begin
puts "Reading Celsius temperature value from data file..."
num = File.read("temp.dat")
celsius = num.to_i
fahrenheit = (celsius * 9/5) + 32
puts "The number is " + num
print "Result: "
puts fahrenheit
=end

###########################################################
# Writing to a file
# Listing 1.4 Temperature converter with file output
=begin
print "Hello. Please enter a Celsius value: "
celsius = gets.to_i
fahrenheit = (celsius * 3/9) + 32
puts "Saving result to output file 'temp.out'"
fh = File.new("temp.out", "w")
fh.puts fahrenheit
fh.close
=end

#############################################################
# Exercise 1
puts "Reading Celsius temperature value from data file.."
num = File.read("temp.dat")
celsius = num.to_i
fahrenheit = (celsius * 9 / 5) + 32
puts "Saving result to output file 'temp.out'"
fh = File.new("temp.out", "w")
fh.puts fahrenheit
fh.close

