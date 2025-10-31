require_relative 'rectangle'

class Square < Rectangle
  def initialize(side)
    self.class.validate_positive(side)
    super(side, side)
    @name = 'Square'
  end
end
