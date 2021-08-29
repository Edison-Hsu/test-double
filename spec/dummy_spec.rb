require 'rspec'

require_relative '../lib/fridge'
require_relative '../lib/thing'
require_relative '../lib/chef'

class Dummy < Thing
  def initialize
    super(vol: 5)
  end
end

describe "dummy example: the fridge door" do
  let(:fridge) { Fridge.new(cap: 10) }
  let(:dummy) { Dummy.new }

  it 'should be close after put' do
    chef = Chef.new(fridge: fridge)
    chef.store(thing: dummy)
  
    expect(fridge.is_open).to eq false 
  end
end
