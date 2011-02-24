require 'spec_helper'

describe Money::Formatter::DecimalMark do
  let(:money)  { Money.new(100, 'EUR') }
  let(:params) do
    {
      :previous => money, :formatted_string => "#{money.cents}",
      :next => nil
    }
  end

  it 'uses the decimal mark specified' do
    params.merge!(:rules => { :decimal_mark => '@' })
    Money::Formatter::DecimalMark.new(params).format.should == '1@00'
  end

  it 'uses the default decimal mark if true is passed in' do
    params.merge!(:rules => { :decimal_mark => true })
    Money::Formatter::DecimalMark.new(params).format.should == '1,00'
  end

  it 'uses the default decimal mark if none is specified' do
    Money::Formatter::DecimalMark.new(params).format.should == '1,00'
  end

  it 'does not retun decimal marks if set to false' do
    params.merge!(:rules => { :decimal_mark => false })
    Money::Formatter::DecimalMark.new(params).format.should == '100'
  end

end
