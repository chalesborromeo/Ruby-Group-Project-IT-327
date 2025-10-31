# General Shape superclass (abstract)
class Shape
	attr_reader :name

	def initialize(name = self.class.name)
		@name = name
	end

	# Subclasses must implement
	def area
		raise NotImplementedError, "#{self.class}#area must be implemented by subclasses"
	end

	def perimeter
		raise NotImplementedError, "#{self.class}#perimeter must be implemented by subclasses"
	end

	def to_s
		"#{name}"
	end

	# Utility validator used by subclasses
	def self.validate_positive(*values)
		values.each do |v|
			unless v.is_a?(Numeric) && v > 0
				raise ArgumentError, "Dimensions must be numeric and > 0 (got #{v.inspect})"
			end
		end
	end
end

