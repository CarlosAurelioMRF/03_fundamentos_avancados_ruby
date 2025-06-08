class Operators
  def is_greater_than_one(number)
    puts "get into is_greater_than_one"

    number > 1
  end

  def is_greater_than_two(number)
    puts "get into is_greater_than_two"

    number > 2
  end

  def main
    if is_greater_than_one(2) and is_greater_than_two(2)
      puts "Both conditions are true"
    end 
  end

end

# Create an instance of the Operators class
operators = Operators.new

# Call the main method
operators.main
