# encoding: utf-8
require 'spec_helper'

describe Money::Formatter::CurrencySymbol do
  let(:money) { Money.new(2000, "EUR") }
  let(:params) do 
    { :previous => money, :rules => {:symbol => true}, 
      :formatted_string => "#{money.cents}" }
  end

  it 'adds the currency symbol to 20 euros' do
    Money::Formatter::CurrencySymbol.new(params).format.should == "20,00 €"
  end

  it 'adds the currency symbol to 30 euros' do
    params.merge!(:previous => Money.new(3000, "EUR"), :formatted_string => '3000')
    Money::Formatter::CurrencySymbol.new(params).format.should == "30,00 €"
  end

  it 'adds the currency symbol to 30 usd' do
    params.merge!(:previous => Money.new(3000, "USD"), :formatted_string => '3000')
    Money::Formatter::CurrencySymbol.new(params).format.should == "$30.00"
  end

  it 'does not add the currency symbol if :symbol is set to false' do
    params.merge!(:rules => { :symbol => false } )
    Money::Formatter::CurrencySymbol.new(params).format.should == "20,00"
  end

  it 'does not add the currency symbol if :symbol is set to nil' do
    params.merge!(:rules => { :symbol => nil } )
    Money::Formatter::CurrencySymbol.new(params).format.should == "20,00"
  end

  it 'does not add the currency symbol if :symbol is set to an empty string' do
    params.merge!(:rules => { :symbol => '' } )
    Money::Formatter::CurrencySymbol.new(params).format.should == "20,00"
  end

  it 'does not add the currency symbol if :symbol is set to true' do
    params.merge!(:rules => { :symbol => true } )
    Money::Formatter::CurrencySymbol.new(params).format.should == "20,00 €"
  end

  it 'adds the default money symbol when the money symbol is not know for the currency passed' do
    params.merge!(:rules => { :symbol => true }, :previous => Money.new(2000, 'ETB'))
    Money::Formatter::CurrencySymbol.new(params).format.should == "20.00 ¤"
  end

  it 'displays the user defined symbol' do
    params.merge!(:rules => { :symbol => '¢±'}, :previous => Money.new(2000, 'ETB'))
    Money::Formatter::CurrencySymbol.new(params).format.should == "20.00 ¢±"
  end
end
