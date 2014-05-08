class SatNav
  attr_reader :junctions

  def initialize(number_of_junctions, instructions)
    letters = ("A".."Z").first(number_of_junctions)

    @junctions = letters.inject({}) do |junctions, name|
      junction_instrcutions = instructions.select { |i| i[0] == name }
      junctions.merge(name => Junction.new(name, junction_instrcutions))
    end
  end

  def distance_of(journey)
    start = @junctions[journey[0]]
    destination = @junctions[journey[1]]

    start.to(destination.name)
  end
end