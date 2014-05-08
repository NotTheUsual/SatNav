class Junction
  attr_reader :name

  def initialize(name, instructions = [])
    @name = name
    @distances = distances_from(instructions)
  end

  def to(destination)
    @distances[destination.name]
  end

  def can_access?(destination)
    @distances.keys.include?(destination.name)
  end

  private

  def distances_from(instructions)
    instructions.inject({}) do |distances, instruction|
      destination, distance = instruction[1], instruction[2].to_i
      distances.merge(destination => distance)
    end
  end
end