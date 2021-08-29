require_relative "./thing"

class FridgeIsFullError < StandardError; end
class FridgeDoorNotOpenError < StandardError; end
class NotSupportThingError < StandardError; end

class Fridge
  attr_reader :cap, :is_open

  def initialize(cap:)
    @cap = cap
    @content = []
    @is_open = false
  end

  def open
    @is_open = true
  end

  def put(thing)
    raise FridgeDoorNotOpenError unless @is_open

    # if thing.respond_to?('map')
    #   thing.each {|t| put_one(t)} 
    # else
    #   put_one(thing)
    # end
    put_one(thing)
  end

  def get(name, amount:1)
    raise FridgeDoorNotOpenError unless @is_open

    get_one(thing)
  end

  def close
    @is_open = false
  end

  private

  def put_one(thing) 
    raise NotSupportThingError unless thing.kind_of? Thing
    @cap -= thing.vol if @cap >= thing.vol 
    @content << thing
  end

  def get_one(name)
    thing = @content.select {|t| t.name == name}
    @cap += thing.vol if thing
    thing
  end
end

