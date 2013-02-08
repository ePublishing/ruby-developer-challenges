class ArgumentParser
  def initialize
  end

  def parse(args)
    local = validate_arglist(args)
    tokens = local.split(', ')
    tokens.each do |token|
      validate_element(token)
    end
  end

  private

  def raise_arg_error
    raise ArgumentError, "Args list is invalid"
  end

  def validate_arglist(args)
    raise_arg_error unless args.kind_of? String
    raise_arg_error unless the_match = args.match(/^{(.*)}$/)
    the_match[1]
  end

  def validate_element(token)
    the_match = token.match(/^(\|{.*|\|}.*|\|\,.*)$/)
    raise_arg_error unless the_match
    the_match
  end

end
