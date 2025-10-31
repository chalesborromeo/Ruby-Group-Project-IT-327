require_relative 'Shape'

class Rectangle < Shape
  def initialize(width, height)
    self.class.validate_positive(width, height)
    @width = width
    @height = height
    super('Rectangle')
  end

  def area
    @width * @height
  end

  def perimeter
    2 * (@width + @height)
  end

  def to_s
    "#{name} (#{@width} x #{@height})"
  end
end
