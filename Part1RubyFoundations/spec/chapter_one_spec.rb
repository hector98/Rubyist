require 'rspec'
require_relative '../chapter_one.rb'

RSpec.describe TemperatureConverter do
  describe "#first_simple_program" do
    it "number positive" do
      conv = TemperatureConverter.new
      resul = conv.first_simple_program(100)
      expect(resul).to eq(212)
    end

    it "number negative" do
      conv = TemperatureConverter.new
      resul = conv.first_simple_program(-5)
      expect(resul).to eq(23)
    end

    it "value cero" do
      conv = TemperatureConverter.new
      resul = conv.first_simple_program(0)
      expect(resul).to eq(32)
  end
  end
end
