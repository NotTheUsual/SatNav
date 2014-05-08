# Sat Nav

Command line application to model a Sat Nav for a very small town.

## To Run

In irb, require the `sat_nav` file, and create your SatNav. The first argument is the number of junctions (which will be named A,B,C,etc...), the second is an array of all the one way streets in the system (AB4 is a street from A to B of distance 4).

```ruby
require_relative 'lib/sat_nav`
sat_nav = SatNav.new(5, ["AB5", "BC4", "CD7", "DC8", "DE6", "AD5", "CE2", "EB3", "AE7"])
```

Then, you can ask your Sat Nav a variety of questions.

The distances of a given journey:

```ruby
sat_nav.distance_of("AB")
#=> 5
sat_nav.distance_of("ABC")
#=> 9
```

The shortest route between two points:

```ruby
sat_nav.shortest_route_between("C", "C")
#=> 9
```

And the number of routes between two points, given certain conditions:

```ruby
# Maximum number of junctions
sat_nav.number_of_routes_between("C", "C", max_junctions: 3)
#=> 2

# Exact number of junctions
sat_nav.number_of_routes_between("A", "C", junctions: 4)
#=> 3

# Maximum distance of the route
sat_nav.number_of_routes_between("C", "C", max_distance: 30)
#=> 9
```