require 'rspec'

require_relative '../lib/fridge'
require_relative '../lib/thing'

describe "stub example: the fridge volumn" do
  let(:fridge) { Fridge.new(cap: 10) }

  it 'should decrease volumns correctly after put something' do
    fridge.open
    fridge.put(Thing.new(vol: 3))
    fridge.close
  
    expect(fridge.cap).to eq 7
  end
end

