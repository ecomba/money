require 'spec_helper'

describe Money::Formatter::DisplayFree do

  let(:money)  { Money.new(0, 'EUR') }
  let(:params) do
    {:previous => money, :formatted_string => money.cents, :next => nil }
  end

  it 'displays free when value for money is 0' do
    params.merge!(:rules=>{:display_free => true })

    Money::Formatter::DisplayFree.new(params).format.should == 'free'
  end

  it 'displays a suplied string for 0 valued money' do
    params.merge!(:rules=>{:display_free => 'gratis' })

    Money::Formatter::DisplayFree.new(params).format.should == 'gratis'
  end

  it 'displays the money value if the value was bigger than 0' do
    params.merge!(:previous => Money.new(1000, 'EUR'), :formatted_string => '1000')
    params.merge!(:rules=>{:display_free => 'gratis' })

    Money::Formatter::DisplayFree.new(params).format.should == '1000'
  end
end
