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
