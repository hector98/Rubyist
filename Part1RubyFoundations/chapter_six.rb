# Chapter 6
# Control-flow techniques

# The if keyword and its variants
condition = true

if condition
  # code here, executed if condition is true
end

x = 8
if x > 1 then puts x end
# /
if x > 1; puts x; end

# The else and elsif keyword
# if condition
#   code executed if condition is true
# else
#   code executed if condition is false
# end
#
# if condition1
#   code executed if condition1 is true
# elsif condition2
#   code executed if condition1 is false
#   and condition2 is true
# elsif condition3
#   code executed if neither condition1
#   nor condition2 is true, but condition3 is
# end

def print_conditionally
  print "Enter an integer: "
  n = gets.to_i
  if n > 0
    puts "Your number is positive."
  elsif n < 0
    puts "Your number is negative."
  else
    puts "Your number is zero."
  end
end
print_conditionally

# The unless keyword
unless x > 100
  puts "Small number!"
else
  puts "Big number!"
end

# Coditional modifiers
puts "Big number!" unless x <= 100
# puts "done" && return (x > y && a < b) unless c == 0

# The value of if statements
x = 1
if x < 0
  "negative"
elsif x > 0
  "positive"
else
  "zero"
end

# Listing 6.1 Interpreting user input with a case statement
def quit_or_not
  print "Exit the program? (yes or no): "
  answer = gets.chomp
  case answer
  when "yes"
    puts "Good-bye!"
    exit
  when "no"
    puts "Ok, we'll continue"
  else
    puts "That's an unknown -- assuming you meant 'no'"
  end
  puts "Continue with program..."
  quit_or_not
end
#quit_or_not

# Programming object's case statement behavior
# Listing 6.2 Implementing case statement behavior for
# Ticket class
class Ticket
  attr_accessor :venue, :date
  
  def initialize(venue, date)
    self.venue = venue
    self.date = date
  end

  def ===(other_ticket)
    self.venue == other_ticket.venue
  end
end
ticket1 = Ticket.new("Town Hall", "07/08/19")
ticket2 = Ticket.new("Conference Center", "08/07/21")
ticket3 = Ticket.new("Town Hall", "08/09/18")
puts "ticket1 is for an event at: #{ticket1.venue}"
case ticket1
when ticket2
  puts "Same location as ticket2"
when ticket3
  puts "Same location as ticket3"
else
  puts "No match."
end

# Undicondial looping with the loop method
#loop { puts "Looping forever!" }
#
#loop do
# puts "Looping forever!"
#end

# Controlling the loop
n = 1
loop do
  puts n
  n = n + 1
  break if n > 9
end
puts "Done!"
####
n = 1
loop do
  puts n
  n = n + 1
  break  unless n == 10
end
puts "Done!"

# The while keyword
n = 1
while n < 11
  puts n
  n += 1
end
puts "Done!"

# begin
n = 1
begin
  puts n
  n += 1
end while n < 11
puts "Done!"

# The until keyword
n = 1
until n > 10
  puts n
  n += 1
end

# Multiple assigment in conditional statements
if (a, b = [4, 8])
  puts a
  puts b
end

# 6.3 Using for/in with the Temperature class
class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
end

celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
puts "Celsius\tFahrenheit"
for c in celsius
  puts "#{c}\t#{Temperature.c2f(c)}"
end

# The anatomy of a method call
#string.scan(/[^,]+/)
#string.scan(/[^,]+/) { |word| puts word }

# Implementing times
5.times { puts "Writing this 5 times!" }

# Listing 6.4 yield at work in Integer#my_times
class Integer
  def my_times
    c = 0
    puts "c = 0"
    puts "until c == #{self}..."
    
    until c == self
      yield c
      c += 1
    end
    self
  end
end

ret = 5.my_times { |i| puts "I'm on interation #{i}!" }
puts ret

# The importance of begin each
array = [1, 2, 3, 4, 5]
array.each { |e| puts "The block just got handed #{e}." }

class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end
end
array.my_each { |e| puts "The block just got handed #{e}." }

# From each to map
names = ["Hector", "Manuel"]
names.map { |name| name.upcase }
puts "#{names}\n"

class Array
  def my_map
    c = 0
    acc = []
    until c == size
      e = yield self[c]
      acc << e
      c += 1
    end
    acc
  end
end
names.my_map { |name| name.upcase }
puts "#{names}\n"
