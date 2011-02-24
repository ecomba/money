require 'spec_helper'

describe Money::Formatter::NoCents do
  let(:money)  { Money.new(100, 'EUR') }
  let(:params) do
    {
      :previous => money, :formatted_string => "#{money.cents}",
      :next => nil, :rules => { :no_cents => true }
    }
  end

  it 'should not show the cents of the currency' do
    Money::Formatter::NoCents.new(params).format.should == '1'
  end

  it 'should show the cents of the currency' do
    params.merge!(:rules => { :no_cents => false })
    Money::Formatter::NoCents.new(params).format.should == '100'
  end

  it 'should show the cents of the currency by default' do
    params.merge!(:rules => {})
    Money::Formatter::NoCents.new(params).format.should == '100'
  end
end
