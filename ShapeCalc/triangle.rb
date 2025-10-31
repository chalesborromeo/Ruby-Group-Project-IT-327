require_relative 'Shape'

class Triangle < Shape
  # Accepts either (base, height) OR (a, b, c) side lengths
  def initialize(base = nil, height = nil, a = nil, b = nil, c = nil)
    if base && height
      self.class.validate_positive(base, height)
      @base = base
      @height = height
      @sides = nil
    elsif a && b && c
      self.class.validate_positive(a, b, c)
      @sides = [a.to_f, b.to_f, c.to_f]
    else
      raise ArgumentError, 'Triangle requires base & height OR three sides a,b,c'
    end
    super('Triangle')
  end

  def area
    if @base && @height
      0.5 * @base * @height
    else
      a, b, c = @sides
      s = (a + b + c) / 2.0
      Math.sqrt([s * (s - a) * (s - b) * (s - c), 0].max)
    end
  end

  def perimeter
    if @sides
      @sides.reduce(:+)
    else
      raise NotImplementedError, 'Perimeter requires side lengths (a,b,c) for triangle'
    end
  end

  def to_s
    if @sides
      "Triangle sides=#{@sides.inspect}"
    else
      "Triangle base=#{@base} height=#{@height}"
    end
  end
end
