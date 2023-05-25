# Chapter two
# Objects, methods, and local variables

# Creating a generic object
obj = Object.new

# Defining an object's behavior(comportamiento)
def obj.talk
  puts "I am an object"
  puts "(Do you object?)"
end

# Sending  messages to objects
obj.talk

# Methods that take arguments
def obj.c2f(c)
  c * 9.0 / 5 + 32
end

puts obj.c2f(100) #The result is 212.0

# use parentheses
def welcome_the_user()
  puts "Hi there!"
end
####################
def welcome_the_user
  puts "Hi there!"
end

# Creating the ticket object
ticket = Object.new

def ticket.date
  "1998-05-12"
end

def ticket.venue
  "Town Hall"
end

def ticket.event
  "Author's reading"
end

def ticket.performer
  "Mark in Mexico"
end

def ticket.seat
  "Secund Balcony, row J, seat 12"
end

def ticket.price
  5.56747372
end

# Querying the ticket  object
print "This ticket is for: "
print ticket.event + ", at "
print ticket.venue + ", on "
puts ticket.date + "."
print "The performer is "
puts ticket.performer + "."
print "The seat is "
print ticket.seat + ", "
print "and is costs $"
puts "%.2f." % ticket.price # Prints floating-point number to two decimal places

# Shortening the ticket code via string interpolation

puts "This ticket is for: #{ticket.event}, at #{ticket.venue}.\n" + "The performer is #{ticket.performer}.\n" +
  "The seat is #{ticket.seat}, " +
  "and it costs $#{"%.2f." % ticket.price}"

# Ticket availability: expressing Boolean state in a method

def ticket.availability_status
  "sold"
end

def ticket.available?
  false
end

if ticket.available?
  puts "You're in luck!"
else
  puts "Sorry-that seat has been sold."
end

# The innate behaviors of an object
p Object.new.methods.sort

# identifying objects uniquely with the object_id method
obj = Object.new
puts "The id of obj is #{obj.object_id}."
str = "String are object too, and this is a string!"
puts "The id of the string object str is #{str.object_id}."
puts "And the id of the integer 100 is #{100.object_id}."

a = Object.new
b = a
puts "a's id is #{a.object_id} and b's id is #{b.object_id}."

string_1 = "Hello"
string_2 ="Hello"
puts "string_1's id is #{string_1.object_id}."
puts "string_2's id is #{string_2.object_id}."

# Querying an object's abilities with the respond_to? method
obj = Object.new
#obj.talk Error undifined method talk

obj = Object.new
if obj.respond_to?("talk")
  obj.talk
else
  puts "Sorry, the object doesn't understand the 'talk' messages."
end

# Sending messages to objects with the send method
print "information desired"
request = gets.chomp

if ticket.respond_to?(request)
  puts ticket.send(request)
else
  puts "No such information available"
end

# Required and optional arguments
obj = Object.new
def obj.one_arg(x)
  puts "I require one and only one argument!"
end
#obj.one_arg(1,2,3) Error

def obj.multi_args(*x)
  puts "I can take zero, or more arguments"
end

def two_or_more(a, b, *c)
  puts "I require two or more arguments!"
  puts "And sure enough, I got: "
  p a, b, c
end

two_or_more(1,2,3,4,5)

# Default values for arguments
def default_args(a, b, c=8)
  puts "Values of variables: ",a,b,c
end

default_args(3,2)
default_args(4,5,6)

# Order of parameters and arguments
def mixed_args(a, b, *c, d)
  puts "Arguments: "
  p a, b, c, d
end
mixed_args(1,2,3,4,5)





