class Calculator
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    puts "Value: #{@@count}"
  end
end

Calculator.new
Calculator.new
Calculator.count