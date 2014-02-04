class Polynomial
  def initialize(elements=[])
    raise ArgumentError.new "Two or more coefficients are required" if elements.length < 2
    my_elements = elements.dup
    @poly = ""
    until my_elements.empty?
      exponent = (my_elements.length - 1).to_i
      coefficient = my_elements.shift.to_i
      next if coefficient.to_i == 0
      @poly <<
          if [1, -1].include?(coefficient)
            sign(coefficient)
          else
            sign(coefficient) + coefficient.abs.to_s
          end

      @poly <<
          case exponent
            when 0
              ''
            when 1
              'x'
            else
              "x^#{exponent}"
          end

    end

    @poly.gsub!(/^\+/, '')
    @poly = "0" if @poly.size == 0
  end

  def to_s
    @poly
  end

  private

  def sign(number)
    number.to_i < 0 ? "-" : "+"
  end
end
