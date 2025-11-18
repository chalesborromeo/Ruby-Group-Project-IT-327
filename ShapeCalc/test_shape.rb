require_relative 'Shape'
require_relative 'rectangle'
require_relative 'square'
require_relative 'circle'
require_relative 'triangle'

def print_menu
  puts "\n" + "=" * 50
  puts "SHAPE CALCULATOR MENU"
  puts "=" * 50
  puts "1. Calculate Rectangle (length and width)"
  puts "2. Calculate Square (side length)"
  puts "3. Calculate Circle (radius)"
  puts "4. Calculate Triangle (base and height)"
  puts "5. Calculate Triangle (three sides - Heron's formula)"
  puts "6. Exit"
  puts "=" * 50
  print "Enter your choice (1-6): "
end

def get_positive_number(prompt)
  loop do
    print prompt
    input = gets.chomp
    num = input.to_f
    return num if num > 0
    puts "Error: Please enter a positive number."
  end
end

def calculate_rectangle
  puts "\n--- Rectangle Calculator ---"
  length = get_positive_number("Enter length: ")
  width = get_positive_number("Enter width: ")
  
  begin
    r = Rectangle.new(length, width)
    puts "\nResults:"
    puts "  Shape: Rectangle (#{length} x #{width})"
    puts "  Area: #{r.area}"
    puts "  Perimeter: #{r.perimeter}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end

def calculate_square
  puts "\n--- Square Calculator ---"
  side = get_positive_number("Enter side length: ")
  
  begin
    s = Square.new(side)
    puts "\nResults:"
    puts "  Shape: Square (#{side} x #{side})"
    puts "  Area: #{s.area}"
    puts "  Perimeter: #{s.perimeter}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end

def calculate_circle
  puts "\n--- Circle Calculator ---"
  radius = get_positive_number("Enter radius: ")
  
  begin
    c = Circle.new(radius)
    puts "\nResults:"
    puts "  Shape: Circle (radius = #{radius})"
    puts "  Area: #{c.area}"
    begin
      puts "  Perimeter: #{c.perimeter}"
    rescue NotImplementedError
      puts "  Perimeter: Not implemented"
    end
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end

def calculate_triangle_base_height
  puts "\n--- Triangle Calculator (Base & Height) ---"
  base = get_positive_number("Enter base: ")
  height = get_positive_number("Enter height: ")
  
  begin
    t = Triangle.new(base, height)
    puts "\nResults:"
    puts "  Shape: Triangle (base = #{base}, height = #{height})"
    puts "  Area: #{t.area}"
    begin
      puts "  Perimeter: #{t.perimeter}"
    rescue NotImplementedError
      puts "  Perimeter: Not available (need all three sides)"
    end
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end

def calculate_triangle_three_sides
  puts "\n--- Triangle Calculator (Three Sides) ---"
  side_a = get_positive_number("Enter side a: ")
  side_b = get_positive_number("Enter side b: ")
  side_c = get_positive_number("Enter side c: ")
  
  begin
    t = Triangle.new(nil, nil, side_a, side_b, side_c)
    puts "\nResults:"
    puts "  Shape: Triangle (sides = #{side_a}, #{side_b}, #{side_c})"
    puts "  Area: #{t.area}"
    puts "  Perimeter: #{t.perimeter}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end

def main
  puts "\n" + "*" * 50
  puts "*" + " " * 48 + "*"
  puts "*      WELCOME TO THE SHAPE CALCULATOR!        *"
  puts "*" + " " * 48 + "*"
  puts "*" * 50
  
  loop do
    print_menu
    choice = gets.chomp
    
    case choice
    when "1"
      calculate_rectangle
    when "2"
      calculate_square
    when "3"
      calculate_circle
    when "4"
      calculate_triangle_base_height
    when "5"
      calculate_triangle_three_sides
    when "6"
      puts "\nThank you for using the Shape Calculator!"
      puts "Goodbye!\n\n"
      break
    else
      puts "\nInvalid choice! Please enter a number between 1 and 6."
    end
    
    print "\nPress Enter to continue..."
    gets
  end
end

# Run the program
main if __FILE__ == $PROGRAM_NAME
