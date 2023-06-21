# Chapter 7
# Built-in essentials

#  Defining operators by defining methods
obj = Object.new

def obj.+(other_obj)
  "Trying to add something to me, eh?"
end

puts obj + 100

#---------------------------------------------#

class Account
  attr_accessor :balance
  def initialize(amount = 0)
    self.balance = amount
  end

  def +(x)
    self.balance += x
  end

  def -(x)
    self.balance -= x
  end

  def to_s
    balance.to_s
  end
end
acc = Account.new(20)
acc -= 5
puts acc # Output 15

# Customizing unary operators
class Banner
  def initialize(text)
    @text = text
  end

  def to_s
    @text
  end

  def +@
    @text.upcase
  end

  def -@
    @text.downcase
  end
end

banner = Banner.new("Eat at Hector's!")
puts banner
puts +banner
puts -banner

# Born to be overriden: inspect
class Person
  def initialize(name)
    @name = name
  end

  def inspect
    @name
  end
end
hector = Person.new("Hector")
puts hector.inspect

# Using Display
"Hello".display
puts

# Array conversion with to_a the * operator
p (1..5).to_a
puts

#------------------------------------------#
Computer = Struct.new(:os, :manofacture)
laptop1 = Computer.new("Linux", "Lenovo")
laptop2 = Computer.new("os x", "Apple")
p [laptop1, laptop2].map { |laptop| laptop.to_a }
puts

#--------------------------------------------#
def combine_names(first_name, last_name)
  first_name + " " + last_name
end
names = ["Hector", "Manuel"]
puts combine_names(*names)

# Numerical conversion with to_i and to_f
print "Enter a number: "
n = gets.chomp
puts n * 10
puts n.to_i * 10
puts n.to_f * 10

# Array Role-Playing with to_ary
class Person2
  attr_accessor :name, :age, :email
  def to_ary
    [name, age, email]
  end
end

hector = Person2.new
hector.name = "Hector"
hector.age = 25
hector.email = "hector@gmail.com"
array = []
array.concat(hector)
p array
puts

# True and false as states
# Listing 7.1 Testing the Boolean value of expressions
# using if construtor
if (class MyClass end)
  puts "Empty class definition is true!"
else
  puts "Empty class definition is false!"
end

if (class MyClass; 1; end)
  puts "Class definition with the number 1 in it is true!"
else
  puts "Class definition with the number 1 in it is false!"
end

if (def m; return false; end)
  puts "Method definition is true!"
else
  puts "Method definition is false!"
end

if "string"
  puts "String appear to be true!"
else
  puts "String appear to be false!"
end

if 100 > 50
  puts "100 is greater than 50"
else
  puts "100 is not greater than 50"
end

# true and false as objects
puts true.class
puts false.class

# Listing 7.2 Example of a class that mixes in the Comparable module
class Bid
  include Comparable
  
  attr_accessor :estimate

  def <=>(other_bid)
    if self.estimate < other_bid
      -1
    elsif self.estimate > other_bid
      1
    else
      0
    end
  end
end
