# Chapter 10
# Collection central:
# Enumerable and Enumerator

# Gaining enumerability throgh each
# Listing 10.1 An Enumerable class and its deployment of the each method

class Rainbow
  include Enumerable

  def each
    yield "red"
    yield "orange"
    yield "green"
    yield "blue"
    yield "indigo"
    yield "violet"
  end
end

r = Rainbow.new
r.each do |color|
  puts "Next color: #{color}"
end
