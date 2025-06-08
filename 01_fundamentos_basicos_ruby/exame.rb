class Calculator
  def add(a, b)
    puts "Sum #{a + b}"
  end

  def greet(name)
    puts "Hello, #{name}!"
  end

  def multiply(a, b, c)
    puts "Product #{a * b * c}"
  end
end

calc = Calculator.new

calc.add(2, 3)
calc.greet("Alice")
calc.multiply(2, 3)