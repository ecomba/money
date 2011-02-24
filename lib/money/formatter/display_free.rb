class Money::Formatter::DisplayFree
  include Money::Formatter

  def initialize(options)
    @options = options
    @display_free = rules[:display_free] || false if rules
  end

  def class_format
    return formatted if cents > 0
    return @display_free if @display_free.respond_to?(:to_str)
    return "free" if @display_free
    return formatted
  end

  def next_formatter
    Money::Formatter::ThousandSeparator
  end
end
