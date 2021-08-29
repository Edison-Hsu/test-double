require 'rspec'

require_relative '../lib/fridge'
require_relative '../lib/chef'
require_relative '../lib/thing'

describe "mock example: the fridge volumn" do
  it 'should decrease volumn correctly after put something' do
    mock = double("mock fridge")

    chef = Chef.new(fridge: mock)
    thing = Thing.new(vol: 3)

    expect(mock).to receive(:open)
    expect(mock).to receive(:put).with(thing)
    expect(mock).to receive(:close)

    chef.store(thing: thing)
  end
end


