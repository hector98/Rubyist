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
=begin
def discount(percent)
  @price = @price *( 100 - percent) /100.0
end
=end

#The equal sign (=) in method names
class Ticket
  def initialize(venue, date, price)
    @venue = venue
    @date = date
    @price = price
  end
  #etc
  def price
    @price
  end
  #etc.
end
th = Ticket.new("Town Hall", "2023-05-29", 63.00)
###############################
class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def set_price(amount)
    @price = amount
  end

  def price
    @price
  end
end
ticket = Ticket.new("Town Hall", "2023-06-23")
ticket.set_price(63.00)
puts "The ticket costs $#{"%.2f" % ticket.price}."
ticket.set_price(72.50)
puts "Whoops -- it just went up. It now costs $#{"%.2f" % ticket.price}."

# Syntactic sugar for assignment-like methods
# ticket.price(63.00) or ticket.price = 63.00

# Setter methods unleashed
class Silly
  def price=(x)
    puts "The current time is #{Time.now}"
  end
end
s = Silly.new
s.price = 111.22

class Ticket
  def price=(amount)
    if (amount * 100).to_i == amount * 100
      @price = amount
    else
      puts "The price seems to be malformed"
    end
  end
  def price
    @price
  end
end

class TravelAgentSession
  def year=(y)
    @year = y.to_i
    if @year < 100
      @year = @year + 2000
    end
  end
end

# Exercises
# 1
class Ticket_e1
  def initialize(venue, price)
    @venue = venue
    @price = price
  end

  def venue
    @venue
  end
  def discount=(disc)
    @discount = @price - (@price * (disc/100))
  end
end
tk = Ticket_e1.new("Town Hall", 100)
puts "The ticket for #{tk.venue} has been discounted 15% to #{tk.discount = 15}"

# Automating the creation of attributes
# Listing 3.2 Ticket class, with the attribute
# reader/writer methods spelled out
class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def price=(price)
    @price = price
  end

  def venue
    @venue
  end

  def date
    @date
  end

  def price
    @price
  end
end

# Listing 3.3 Ticket class, with getter and setter methods
# defined via attr_* calls
class Ticket
  attr_reader :venue, :date, :price
  attr_writer :price
  
  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end

# Inhertance and the Ruby class hierarchy
class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end

mag = Magazine.new
mag.publisher = "Hector M. Barrios"
mag.editor = "Joe Leo"
puts " Mag is published by #{mag.publisher} and edited by #{mag.editor}"

class Person
  def species
    "Homo Sapiens"
  end
end

class Rubyist < Person
end

hector = Rubyist.new
puts hector.species

# Object ancestry and the not-so-missing link: the Object class

obj = Object.new
class C
end
class D < C
end
puts D.superclass
puts D.superclass.superclass

# Creating class objects
class Ticket
  # Code here
end

my_class = Class.new
instance_of_my_class = my_class.new

# Defining instance methods in connection with Class.new
c = Class.new do
  def say_hello
    puts "Hello"
  end
end

# A singleton method by any other name...
class Ticket 
  attr_reader :venue, :date
  attr_accessor :price
  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end

def Ticket.most_expensive(*tickets)
  tickets.max_by(&:price)
end

# Using the &: shorthand syntax
#["hector", "manuel"].map(&:capitalize)

th = Ticket.new("Town Hall", "2023-12-05")
cc= Ticket.new("Convention Center", "2022-09-23")
fg = Ticket.new("Fairgrounds", "2012-08-08")
th.price = 12.55
cc.price = 10.00
fg.price = 18.89

highest = Ticket.most_expensive(th, cc, fg)
puts "The highest-priced ticket is the one for #{highest.venue}."

# Converting the converter
class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
  
  def Temperature.f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

puts Temperature.c2f(100)

# Basic use of constant
class Ticket
  VENUES = ["Convention Center", "Fairgrounds", "Town hall"]
  def initialize(venue, date)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}"
    end
    @date = date
  end
end

puts Ticket::VENUES
