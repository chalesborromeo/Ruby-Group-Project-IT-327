class Polynomial
  
  #variable accessor
  attr_reader :terms

  def initialize(polynomial_str = nil)
    @terms = Hash.new(0)
    if !polynomial_str.nil? && !polynomial_str.strip.empty?
      parse(polynomial_str)
    end
  end

  def parse(str)
    
    #regex to split polynomial terms into sign, coefficient, exponent, or sign and constant
    str = str.gsub(/\s+/,'')
    tokens = str.scan(/([+\-])?\s*(\d*)x(\^(\d+))?|([+\-])?\s*(\d+)/)

    tokens.each do |match|

      if match[5]
        sign = 0
        if (match[4] == '-')
            sign = -1
        else
            sign = 1
        end

        coefficient = match[5].to_i * sign
        exponent = 0
      else
        sign = 0
        if(match[0] == '-')
            sign = -1
        else
            sign = 1
        end

        if (match[1].empty?)
            coefficient = 1 * sign
        else
            coefficient = match[1].to_i * sign
        end

        if match[3].nil?
            exponent = 1
        else
            exponent = match[3].to_i
        end
      end

      #fills hash table with polynomial term. The keys to the hash are the exponent values, the values are the signed coefficients
      @terms[exponent] += coefficient
      @terms.delete(exponent) if @terms[exponent] == 0
    end
  end


    #function for adding terms by taking exponent and coefficient values (from the term we would like to add). Searches the polynomial object's hash and adds the new term's coefficient to the appropriate index
  def add_term(coefficient, exponent)
    @terms[exponent] += coefficient
    @terms.delete(exponent) if @terms[exponent] == 0
  end

#overload addition operator to be able to handle polynomial objects

  def +(other)
    result = Polynomial.new
    @terms.each { |exponent, coefficient| result.add_term(coefficient, exponent) }
    other.terms.each { |exponent, coefficient | result.add_term(coefficient, exponent)}
    result
  end

  def to_s
     return "0" if @terms.empty?

    sorted_terms = @terms.sort_by { |exp, _| -exp }
    
    result = sorted_terms.map.with_index do |(exp, coeff), i|
  
      if i == 0
        sign = coeff < 0 ? "-" : ""
      else
        sign = coeff < 0 ? " - " : " + "
      end
      
    
      abs_coeff = coeff.abs
     
      coeff_str = if exp == 0
                    abs_coeff.to_s
                  elsif abs_coeff == 1
                    ""
                  else
                    abs_coeff.to_s
                  end
      
      exp_str = if exp == 0
                  ""
                elsif exp == 1
                  "x"
                else
                  "x^#{exp}"
                end
      
      "#{sign}#{coeff_str}#{exp_str}"
    end.join("")
    
    result
  end
end

if __FILE__ == $0
  puts "--Polynomial Addition Calculator--"
  puts "Please enter the first polynomial (ex: 5x^2 + 4x + 3): "
  poly_string_1 = gets.chomp
  
  puts "Please enter the second polynomial (ex: 5x^2 + 4x + 3): "
  poly_string_2 = gets.chomp

  begin 
    poly_1 = Polynomial.new(poly_string_1)
    poly_2 = Polynomial.new(poly_string_2)

    poly_3 = poly_1 + poly_2
    puts "(#{poly_1}) + (#{poly_2}) = #{poly_3}"

  rescue => e
    puts "Error: #{e.message} Please ensure that your formatting is correct."
  end
end