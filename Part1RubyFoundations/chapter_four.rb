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

