module Money::Formatter
  def format
    new_string = self.class_format
    params = @options.dup.merge(:previous => self, :formatted_string => new_string)
    return next_formatter.new(params).format if next_formatter
    return new_string
  end

  def method_missing(method, *args, &block)
    begin
      @options[:previous].send(method, args, &block)
    rescue
      @options[:previous].send(method, &block)
    end
  end

  def formatted
    @options[:formatted_string]
  end

  def rules
    @options[:rules] || {}
  end
end

Dir.glob(File.dirname(__FILE__) + '/formatter/*', &method(:require))
