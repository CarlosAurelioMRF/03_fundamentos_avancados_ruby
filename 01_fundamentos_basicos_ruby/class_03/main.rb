module DogActions
  def bark
    "Woof!"
  end

  def sit
    puts "The dog is sitting."
  end
end

class Dog
  include DogActions

  def initialize(name)
    @name = name
  end

  def hello # method is an instance method
    puts "#{DogActions.bark} #{@name} is barking."
  end
end

mydog = Dog.new("Alexy")
mydog.hello
mydog.sit