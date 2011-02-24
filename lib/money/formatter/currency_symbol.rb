class Money::Formatter::CurrencySymbol
  include Money::Formatter

  def initialize(options)
    @options = options
    @symbol_value, @symbol_position = symbol_value(rules), symbol_position
  end

  def symbol_not_defined_by_user?
    if rules.has_key? :symbol
      return rules[:symbol] === false || rules[:symbol].nil? || rules[:symbol] == ''
    end
    true
  end

  def class_format
    return formatted if symbol_not_defined_by_user?
    add_symbol if @symbol_value && !@symbol_value.empty?
  end

  def next_formatter
    Money::Formatter::DecimalMark
  end

  private
  def add_symbol
    place_symbol_in_correct_position
  end

  def place_symbol_in_correct_position
    @symbol_position == :before ? "#{@symbol_value}#{formatted}" :
      "#{formatted} #{@symbol_value}"
  end

  def symbol_value(rules)
    return symbol_from_rule(rules[:symbol]) if rules.has_key?(:symbol)
    return symbol
  end

  def symbol_from_rule(symbol_in_rule)
    return symbol if symbol_in_rule === true
    return symbol_in_rule if symbol_in_rule
    return ''
  end

  def symbol_position
    return :before if currency.symbol_first?
    return :after
  end
end
