require 'set'

class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class Stack
  attr_reader :head

  def initialize()
    @head = nil
    @size = 0
  end

  def push(new_value)
    new_node = Node.new(new_value)
    new_node.next_node = @head
    @head = new_node
    @size += 1
    return true
  end

  def pop
    return nil if @size == 0
      
    temp_data = @head.data
    @head = @head.next_node
    @size -= 1

    return temp_data
  end

  def peek
    if(@size == 0)
      return nil
    else
      return @head.data
    end
  end

  def empty?
    return @head.nil?
  end

  def size
    return @size
  end
end

def check_symbols(filename)
  match_map = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }.freeze

  stack = Stack.new
  line_count = 0 

  unless File.exist?(filename)
    puts "Error: File not found: #{filename}"
    return "Error"
  end

  File.foreach(filename) do |line|
    line_count += 1
    line.each_char do |c|  
      if ['{', '(', '['].include?(c)
        stack.push(c)

      elsif match_map.key?(c)
        expected = match_map[c] 
        if stack.empty?
          puts "Error on line #{line_count}: Unmatched closing symbol '#{c}'."
          return "Error"
        elsif stack.peek == expected 
          stack.pop
        else
          puts "Error on line #{line_count}: Found closing '#{c}' but expected to close '#{stack.peek}' first."
          return "Error"
        end
      end
    end
  end

  if !stack.empty?
    puts "Error: End of file reached with unmatched opening symbol '#{stack.peek}'."
    return "Error"
  else
    puts "Success: All symbols are correctly balanced."
    return "Success"
  end
end

if __FILE__ == $0
  if ARGV.empty?
    puts "Error"
    exit 1
  end
  
  input_filename = ARGV[0]
  check_symbols(input_filename) 
end