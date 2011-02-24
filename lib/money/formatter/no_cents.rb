class Money::Formatter::NoCents
  include Money::Formatter

  def initialize(options)
    @options = options
  end

  def class_format
    if rules
      return unit if rules[:no_cents]
    end
    return formatted
  end

  def next_formatter
    nil
  end
end
