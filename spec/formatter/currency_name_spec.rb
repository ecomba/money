require 'spec_helper'

describe Money::Formatter::CurrencyName do
  let(:money)  { Money.new(0, 'EUR') }
  let(:params) do
    {
      :previous => money, :formatted_string => "#{money.cents}",
      :rules => { :with_currency => true }
    }
  end

  it 'displays the currency name for Euro' do
    Money::Formatter::CurrencyName.new(params).format.should == '0 EUR'
  end
end
