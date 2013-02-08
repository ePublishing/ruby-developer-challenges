class ArgumentParser

  ESCAPED_OKAY = ['|,', '|{', '|}']
  ESCAPE_REQUIRED = ESCAPED_OKAY.collect{|e| e[1]}

  def initialize
  end

  def parse(args)
    parse_it(validate_arglist(args))
  end

  private

  def raise_arg_error
    raise ArgumentError.new "Args list is invalid"
  end

  def validate_arglist(args)
    raise_arg_error unless args.kind_of? String
    raise_arg_error unless the_match = args.match(/^{(.*)}$/)
    the_match[1]
  end

  def parse_it(my_string)
    str_array = my_string.dup.split(//)
    elements = []
    sub_string = ""

    until(str_array.empty?)
      char = str_array.shift
      case char
        when "|"
          if ESCAPE_REQUIRED.include?(str_array[0])
            sub_string << str_array.shift
          else
            sub_string << char
          end
        when ","
          if str_array[0] == " " # word boundary
            str_array.shift
            elements << sub_string
            sub_string = ""
          else
            raise_arg_error
          end
        else
          raise_arg_error if ESCAPE_REQUIRED.include?(char)
          sub_string << char
        end
    end

    elements << sub_string
  end

end
