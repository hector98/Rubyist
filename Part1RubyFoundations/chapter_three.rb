# Chapter 3
# Organizing objects with classes

# Classes and Instances
class Ticket
  def event
    "Can't really be specified yet..."
  end
end

ticket = Ticket.new
puts ticket.event

# Overriding methods
class C
  def m
    puts "First definition of method m"
  end

  def m
    puts "Second definition od method m"
  end
end
C.new.m

# Reopening classes
class C
  def x
  end
  
  def y
  end
end

puts Time.new.strftime("%m~%d-%y")

# Instance variables and objects state
ticket = Object.new
def ticket.price
  117.50
end

# listing 3.1 An instance variable maintaining its value
# between method calls
class Person
  def set_name(string)
    puts "Setting person's name..."
    @name= string
  end

  def get_name
    puts "Retuning the person's name..."
    @name
  end
end

hector = Person.new
hector.set_name("Hector")
puts hector.get_name

# Initializing an object with state
class Ticket
  def initialize
    puts "Creating a new ticket!"
  end
end

class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def venue
    @venue
  end

  def date
    @date
  end
end

th = Ticket.new("Town hall", "2023-05-29")
cc = Ticket.new("Convention Center", "2022-06-28")
puts "We've created two ticket"
puts "The first is for a #{th.venue} event on #{th.date}."
puts "The second is for a #{cc.venue} event on #{cc.date}."

# Setter methods
