# Chapter 5
# The default object (self),
# scope, and visibility
class C
  puts "Just started class C:"
  puts self

  module M
    puts "Nested module C::M:"
    puts self
  end

  puts "Back in the outer level of C:"
  puts self
end

# Self in instance-method definitions
class C
  def x
    puts "Class C, method x:"
    puts self
  end
end
c = C.new
c.x
puts "That was a call to x from: #{c}"

# Self in singleton-method and class-method definitions
obj = Object.new
def obj.show_me
  puts "Inside singleton method show_me of #{self}"
end
obj.show_me
puts "Back from call to show_me of by #{obj}"

class C
  def C.x
    puts "Class C, method x:"
    puts "self: #{self}"
  end
end
C.x

# Self as the default recelver of messages
class C
  def C.no_dot
    puts "As long as self is C, you can call this method with no dot"
  end
  no_dot
end
C.no_dot
#self.no_dot

class C
  def x
    puts "This is method 'x'"
  end

  def y
    puts "This is method 'y', about to call x without a dot."
    x
  end
end
c = C.new
c.y

# Listing 5.2 Composing whole name from values,
# using method call on implicit self
class Person
  attr_accessor :first_name, :middle_name, :last_name
  def whole_name
    n = first_name + " "
    n << "#{middle_name} " if middle_name
    n << last_name
  end
end
hector = Person.new
hector.first_name = "Hector"
hector.last_name = "Barrios"
puts "Hector's whole name: #{hector.whole_name}"
hector.middle_name = "Manuel"
puts "Hector's new whole name: #{hector.whole_name}"

# Resolving instance variables through self
class C
  def set_v
    @v = "I am an instance variable and I  belong to any instance of C"
  end

  def show_var
    puts @v
  end

  def self.set_v
    @v = "I am an instance variable and belong to C:"
  end
end
C.set_v
c = C.new
c.set_v
c.show_var

# Listing 5.3 Demostrating the relationship between instance 
# variables and self
class C
  puts "Just inside class definition block. Here's self:"
  p self
  @v = "I am an instance variable at the top level of a class body."
  puts "And here's the instance variable @v, belonging to #{self}:"
  p @v

  def show_var
    puts "Inside an instance method definition block. Here's self:"
    p self
    puts "And here's the instance variable @v, belonging to #{self}:"
    p @v
  end
end

c = C.new
c.show_var

# Global scope global variables
$gvar = "I'm a global!"
class C
  def examine_global
    puts $gvar
  end
end
c = C.new
c.examine_global

# Pros and cons of global variables
class Person
  def whole_name
    n = $first_name + " "
    n << "#$middle_name " if $middle_name
    n << $last_name
  end
end

hector = Person.new
$first_name = "Hector"
$middle_name = "Manuel"
$last_name = "Barrios"
puts hector.whole_name

# Local scope
class C
  a = 1
  def local_a
    a = 2
    puts a
  end
  puts a
end
c = C.new
c.local_a

# Listing 5.4 Reusing a variable name in nested local scopes
class C
  a = 5
  module M
    a = 4
    module N
      a = 3
      class D
        a = 2
        def show_a
          a = 1
          puts a
        end
        puts a
      end
      puts a
    end
    puts a
  end
  puts a
end

d = C::M::N::D.new
d.show_a

# Listing 5.5 Demostrating the generation of a new local
# scope per method call
class C
  def x(value_for_a, recurse = false)
    a = value_for_a
    print "Here's the inspect-string for 'self':"
    p self
    puts "And here's a:"
    puts a
    
    if recurse
      puts "Calling myself (recursion)..."
      x("Second value for a")
      puts "Back after recursion; here's a:"
      puts a
    end
  end
end
c = C.new
c.x("First value for a", true)

# Scope and resolution of constants
module M
  class C
    class D
      module N
        X = 1
      end
    end
  end
end

module M
  class C
    X = 2
    class D
      module N
        X = 1
      end
    end
  end
end

puts M::C::D::N::X
puts M::C::X

module M
  class C
    class D
      module N
        X = 1
      end
    end
    puts D::N::X
  end
end

# Forcing and absolute constant path
class Violin
  class String
    attr_accessor :pitch
    
    def initialize(pitch)
      @pitch = pitch
    end
  end
  
  def initialize
    @e = String.new("E")
    @a = String.new("A")
  end

  def history
    ::String.new(maker + ", " + date)
  end
end

# Listing 5.6 Keeping track of car manufacturing statics with
# class variables
class Car
  @@makes = []
  @@cars = {}
  @@total_count = 0

  attr_reader :make
  def self.total_count
    @@total_count
  end

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      @@total_count += 1
    else
      raise "No such make: #{make}."
    end
  end
  
  def make_mates
    @@cars[self.make]
  end
end

Car.add_make("Honda")
Car.add_make("Ford")
h = Car.new("Honda")
f = Car.new("Ford")
h2 = Car.new("Honda")

# Class variables and the class hierachy
class Parent
  @@value = 100
end

class Child < Parent
  @@value = 200
end

class Parent
  puts @@value
end

# Listing 5.7 Car with @@total_count replaced by instance
# by instance variable @total_count
class Car
  @@makes = []
  @@cars = {}

  attr_reader :make

  def self.total_count
    @total_count ||= 0
  end

  def self.total_count=(n)
    @total_count = n
  end

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end
  
  def make_mates
    @@cars[self.make]
  end
end

class Hybrid < Car
end

#h3 = Hybrid.new("Honda")
#f2 = Hybrid.new("Ford")
puts "There are #{Hybrid.total_count} hybrids on the road!"

# Listing 5.8 Baker and other baking-domain classes
class Cake
  def initialize(better)
    @better = better
    @baked = baked
  end
end

class Egg
end

class Flour
end

class Baker
  def bake_cake
    @better = []
    pour_flour
    add_egg
    stir_batter
    return Cake.new(@batter)
  end

  private

  def pour_flour
    @batter.push(Flour.new)
  end

  def add_egg
    @batter.push(Egg.new)
  end

  def stir_batter
  end
end

b = Baker.new
#b.add_egg # Error private method

# Private setter (=) methods
class Dog
  attr_reader :age, :dog_years
  def dog_years=(years)
    @dog_years = years
  end

  def age=(years)
    @age = years
    self.dog_years = years * 7
  end

  private :dog_years=
end

rover = Dog.new
rover.age = 10
puts "Rover is #{rover.dog_years} in dog years."

# Protected methods
# Listing 5.9 Example of a protected method and its use
class C
  def initialize(n)
    @n = n
  end

  def n
    @n
  end

  def compare(c)
    if c.n > n
      puts "The other object's n is bigger."
    else
      puts "The other object's n is the same or smaller."
    end
  end

  protected :n
end
c1 = C.new(100)
c2 = C.new(101)
c1.compare(c2)
