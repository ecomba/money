class Money::Formatter::DecimalMark
  include Money::Formatter

  def initialize(options)
    @options = options
  end

  def class_format
    return formatted if rule_decimal_mark === false
    return add_mark if cents > 0
    return formatted
  end

  def next_formatter
    Money::Formatter::DisplayFree
  end

  private
  def mark_specified_by_user?
    rule_decimal_mark && rule_decimal_mark != true
  end

  def rule_decimal_mark
    return rules[:decimal_mark] if rules
  end

  def my_subunit
    "#{subunit}".gsub!('.','')
  end

  def mark
    (mark_specified_by_user? ? rule_decimal_mark : decimal_mark)
  end

  def add_mark
    formatted.insert(formatted.index("#{unit}") + unit.length, mark)
  end
end
