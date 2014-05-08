class Junction
  attr_reader :name

  def initialize(name, instructions = [])
    @name = name
    @distances = {}
    instructions.each do |instruction|
      destination = instruction[1]
      distance = instruction[2]
      @distances[destination] = distance.to_i
    end
  end

  def to(destination)
    @distances[destination]
  end
end