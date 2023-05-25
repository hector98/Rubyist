require'rspec'
require_relative'../chapter_two.rb'

RSpec.describe Objects do
  describe "#welcome_the_user" do
    it "greting" do
      obj = Objects.new
      r = obj.welcome_the_user
      expect(r).to eq("Hi there!")
    end
  end
end
