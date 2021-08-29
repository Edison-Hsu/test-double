require 'rspec'

require_relative '../lib/fridge'
require_relative '../lib/thing'

class FridgeSpy < Fridge 

  def original_capability
    @content.map(&:vol).reduce(:+) + @cap
  end
end

describe "spy example: the fridge original capability" do
  let(:fridge) { FridgeSpy.new(cap: 10) }

  it 'should not be changed after put something' do
    fridge.open
    fridge.put(Thing.new(vol: 2))
    fridge.put(Thing.new(vol: 4))
    fridge.close
  
    expect(fridge.original_capability).to eq 10
  end
end


