class Money::Formatter::CurrencyName
  include Money::Formatter

  def initialize(options)
    @options = options
  end

  def class_format
    "#{formatted} #{currency.to_s}" if rules[:with_currency]
  end

  def next_formatter
    Money::Formatter::CurrencySymbol
  end
end
