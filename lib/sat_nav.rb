require_relative 'junction'

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
    return distance_between(journey[0], journey[1]) if journey.length == 2
    
    paths = journey.chars.each_cons(2).to_a
    paths.inject(0) { |sum, (a,b)| sum += distance_between(a,b) }
  end

  def number_of_routes_between(start_name, destination_name, **options)
    all_routes = []
    current_route = [start_name]
    start = @junctions[start_name]

    exact_length = options[:junctions]
    max_length = exact_length ? exact_length : options[:max_junctions]
    max_distance = options[:max_distance]

    routes = get_routes_for(start, destination_name, current_route, all_routes, max_length, max_distance)

    routes = filter_exact(routes, exact_length) if exact_length
    
    routes.length
  end

  def shortest_route_between(start_name, destination_name)
    all_routes = get_routes_for(@junctions[start_name], destination_name, [start_name], [], 5)
    route_lengths = all_routes.map { |route| distance_of route.join }
    route_lengths.sort.first
  end

  private

  def distance_between(start_name, end_name)
    start, destination = @junctions[start_name], @junctions[end_name]
    raise "NO SUCH ROUTE" unless start.can_access?(destination)
    start.to destination
  end

  def get_routes_for(start, destination_name, old_route, all_routes, max_length, max_distance = nil)
    start.accessible.each do |junction_name|
      break if max_length && old_route.length > max_length    

      current_route = old_route + [junction_name]

      break if max_distance && distance_of(current_route.join) >= max_distance

      all_routes << current_route if junction_name == destination_name
      
      all_routes += get_routes_for(@junctions[junction_name], destination_name, current_route, all_routes, max_length, max_distance)
    end
    all_routes.uniq
  end

  def filter_exact(routes, exact_length)
    routes.select { |route| route.length == exact_length + 1 }
  end
end