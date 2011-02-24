require 'spec_helper'

describe Money::Formatter::ThousandSeparator do

  let(:money) { Money.new(100000, "EUR") }
  let(:params) { { :previous => money, :formatted_string => "100000", } }

  context 'does not add a thousand seperator' do
    it 'when :thousands_separator is false' do
      set_thousand_separator(false)
      Money::Formatter::ThousandSeparator.new(params).format.should == "100000"
    end

    it 'when :thousands_separator is nil' do
      set_thousand_separator(nil)
      Money::Formatter::ThousandSeparator.new(params).format.should == "100000"
    end

    it 'when :thousands_separator is empty' do
      set_thousand_separator('')
      Money::Formatter::ThousandSeparator.new(params).format.should == "100000"
    end
  end

  context 'adds a thousand seperator' do
    context 'when :thousands_separator is true' do

      before { set_thousand_separator(true) }

      it 'and has no cents separator' do
        Money::Formatter::ThousandSeparator.new(params).format.should == "100.000"
      end

      it 'with cents separator' do
        params.merge!(:formatted_string => '1000.00' )
        Money::Formatter::ThousandSeparator.new(params).format.should == "1.000.00"
      end
    end

    it 'when the separator is defined by the user' do
      set_thousand_separator('%')
      Money::Formatter::ThousandSeparator.new(params).format.should == "100%000"
    end
  end

  def set_thousand_separator(separator)
      params.merge!(:rules => { :thousands_separator => separator})
  end
end
