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
