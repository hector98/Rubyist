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


