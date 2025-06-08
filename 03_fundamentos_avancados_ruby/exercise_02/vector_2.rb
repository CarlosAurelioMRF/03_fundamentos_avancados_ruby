class Vector2
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def *(value)
    return "(#{ value * x }, #{ value * y })" if value.is_a? Numeric

    "#{ (value.x * x)  + (value.y * y) }"
  end

  def coerce(value)
    return  [self, value] if value.kind_of?(Numeric)

    raise TypeError, "Cannot coerce #{value.class} into Vector2"
  end
end

v = Vector2.new(3, 4)

puts v * 2 # Output: (6, 8)
puts v * 2.5 # Output: (7.5, 10.0)
puts v * v # Output: 25 (dot product)
puts 2 * v # Output: (6, 8)
puts 2.5 * v # Output: (7.5, 10.0)