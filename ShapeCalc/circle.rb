require_relative 'Shape'

class Circle < Shape
  PI = Math::PI

  def initialize(radius)
    self.class.validate_positive(radius)
    @radius = radius
    super('Circle')
  end

  def area
    PI * (@radius**2)
  end

  def perimeter
    2 * PI * @radius
  end

  def to_s
    "#{name} (r=#{@radius})"
  end
end
