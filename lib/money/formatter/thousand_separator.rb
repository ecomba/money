class Money::Formatter::ThousandSeparator
  include Money::Formatter

  def initialize(options)
    @options = options
  end

  def class_format
    return add_separator if rules.has_key? :thousands_separator
    formatted
  end

  def next_formatter
    Money::Formatter::NoCents
  end

  private
  def separator
    return thousands_separator if use_default_separator? 
    return '' if separator_not_set?
    return rules[:thousands_separator]
  end

  def add_separator
    formatted.gsub(/(\d)(?=(?:\d{3})+(?:[^\d]|$))/, "\\1#{separator}")
  end

  def use_default_separator?
    rules[:thousands_separator] === true
  end

  def separator_not_set?
    rules[:thousands_separator] === false || rules[:thousands_separator].nil?
  end
end
