# Chapter 4
# Modules and program organization

# Basic of module creation and use
module MyFirstModule
  def ruby_version
    system("ruby -v")
  end
end

class ModuleTester
  include MyFirstModule
end

mt = ModuleTester.new
mt.ruby_version

# Listing 4.2 Mixing the Stacklike module into the Stack class
require_relative "stack"
class Stack
  include Stacklike
end

s = Stack.new
s.add_to_stack("item one")
s.add_to_stack("item two")
s.add_to_stack("item three")
puts "Objects currently on the stack:"
puts s.stack
taken = s.take_from_stack
puts "Removed this objects:"
puts taken
puts "Now on stack:"
puts s.stack

# Listing 4.4 Nonmodular rewrite of the Stack class
class Stack
  attr_reader :stack
  def initialize
    @stack = []
  end

  def add_to_stack(obj)
    @stack.push(obj)
  end

  def take_from_stack
    @stack.pop
  end
end

# Listing 4.5 Using the Stacklike module a second time,
# for different class
class Suitcase
end

class CargoHold
  include Stacklike
  def load_and_report(obj)
    print "Loading objects "
    puts obj.object_id
    add_to_stack(obj)
  end
  
  def unload
    take_from_stack
  end
end

ch = CargoHold.new
sc1 = Suitcase.new
sc2 = Suitcase.new
sc3 = Suitcase.new
ch.load_and_report(sc1)
ch.load_and_report(sc2)
ch.load_and_report(sc3)
first_unloaded = ch.unload
print "The first suitcase off the plane is ..."
puts first_unloaded.object_id

# Listing 4.6 Demostration of module inclusion and inheritance
module M
  def report
    puts "'report' method in module M"
  end
end

class C
  include M
end

class D < C
end

obj = D.new
obj.report

# Listing 4.7 Two same-named methods on a single search path
module InterestBearing
  def calculate_interest
    puts "Placeholder! We're in module InterestBearing."
  end
end

class BankAccount
  include InterestBearing
  
  def calculate_interest
    puts "Placeholder! We're in class BankAccount."
    puts "And we're overriding the calculate_interest method..."
    puts "which was defined in the InterestBearing module."
  end
end
account = BankAccount.new
account.calculate_interest

# Listing 4.8 Mixing in two modules with a same-named
# method defined
module M
  def report
    puts "'report' method in module M"
  end
end

module N
  def report
    puts "'report' method in module N"
  end
end

class C
  include M
  include N
end

c = C.new
c.report


