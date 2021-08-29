require_relative "./fridge"

class Chef
  def initialize(fridge:)
    @fridge = fridge
  end

  def store(thing:)
    @fridge.open
    @fridge.put(thing)
  rescue FridgeIsFullError => e
    puts e
    return false
  ensure
    @fridge.close
  end
end

