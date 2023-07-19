# Chapter 9
# Collection and
# container objects

# Creating a new array
# Array.new
a = Array.new
puts "#{a}"

puts "#{Array.new(3)}"
puts "#{Array.new(3, "abc")}"

# The literal array constructor []
a = []
puts a
a = [1,2, "three", 4, []]
puts "#{a}"

# The %w and %W array constructor
puts "#{%w(Hector Manuel VIII)}"
# or
puts "#{%w{Hector Manuel VIII}}"
#
puts "#{%W(Hector is #{2023 - 1998} years old)}"

# The %i and %I array constructors
puts "#{%i(a b c)}"
h = "Hector"
puts "#{%I("#{h}")}"

# Insterting retrieving and removing array elements
a = []
a[0] = "first"
puts "#{a}"

a = [1,2,3,4,5]
puts "#{a[2]}"

# Setting or getting more than one array element at a time
a = %w(red orange yellow purple gray indigo violet)
puts "#{a}"
puts "#{a[3,2]}"
a[3,2] = "green", "blue"
puts "#{a}"

# Hashes
state_hash = { "Zacatecas" => "Zac.",
               "Jalisco" => "Jal.",
               "Gunajuato" => "Gto.",
               "Sonora" => "Son.",
               "Yucatan" => "Yuc."
}
print "Enter the name of a state: "
state = gets.chomp
abbr = state_hash[state]
puts "The abbreviation is #{abbr}"


# Inserting, retreving and removing hash pairs
# Adding a key/value pair to a hash

state_hash["Colima"] = "Col."
# o sugared version
#state_hash. [] = ("Colima", "Col.")
# use the synonimous method store
state_hash.store("Durango", "Dgo")

h = Hash.new
h["a"] = 1
h["a"] = 2
puts h["a"]

# Combining hashes with other hashes
h1 = { first: "Hector",
       last: "Barrios",
       suffix: "III"}

h2 = {suffix: "Jr."}
h1.update(h2)
puts h1[:suffix]
