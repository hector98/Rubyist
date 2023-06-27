# Chapter 8
# String, symbols, and other scalar objects
#-------------------------------------------#

# String notation
puts "Two plus two is #{2 + 2}"
puts 'Two plus two is #{2 + 2}.'

puts "Escaped interpolation: \"\#{2 + 2}\"."

puts "Backslahes (\\) have to be escaped in double quotes."
puts 'You can just type \ once in a single quoted string.'
puts "But wichever type of quotation mark you use..."
puts "...you have to escape its quotation symbol, such as \"."
puts 'That applies to \' in single-quoted strings too.'
#...

# Other quoting mechanisms
puts %q{You needn't escape apostrophes or quatation marks (', '', ", "") when using %q}

# Here Documents
text = <<EOM
This is the first line of text.
This is the second line.
Now we're done.
EOM
puts text

#---------------------------------------#
a = <<EOM.to_i * 10
5
EOM
puts a

#----------------------------------------#
array = [1, 2, 3, <<EOM, 4]
This is the heredoc!
It becomes array[3].
EOM
p array

# Basic string manipulation
# Getting and setting substrings
string = "Ruby is a cool lenguage."
puts string
puts string[5]
puts string[-12]
#----------------#
puts string[5,10]
puts string[7...14]
puts string[-12..-3]
puts string[-12..20]
puts string[15...-1]
#--------------------#
p string["cool lang"]
puts
p string["very cool lang"]
puts
#-----------------------------#
puts string[/c[ol ]+/]
#---------------------#
string.slice!("cool ")
puts string
#---------------------#
string = "Ruby is a cool language."
puts string
string["cool"] = "great"
puts string

# String combination via interpolation
str = "Hi "
puts "#{str}there"
#-------------------#
puts "The sum is #{2 + 2}."
#---------------------------#
puts "My name is #{class Person
                        attr_accessor :name
                   end
                   h = Person.new
                   h.name = "Hector"
                   h.name
                   }."

#---------------------------------------------#

# Content transformations
puts "Hector's M. Barrios".chop
puts "Hector's M. Barrios\n".chomp
puts "Hector's M. Barrios".chomp('os')

string = "Hector's M. Barrios"
puts string
string.clear
puts string

string = "(to be named later)"
puts string
string.replace("Hector's M. Barrios")
puts string

str = "Hector M. Barrios"
puts str.delete("abs")
puts str.delete("^abc")
puts str.delete("a-e", "^c")

puts "a".succ
puts "abc".succ
puts "azz".succ

# String Conversions
puts "100".to_i(17) # 100 in base 17
puts "100".oct # 100 in base 8
puts "100".hex # 100 in base 16
puts "1.1234".to_f
puts "Hello".to_str
puts "-4e-2i".to_c
puts "4.55".to_r
puts "abcd".to_sym

