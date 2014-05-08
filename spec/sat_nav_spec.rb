require 'sat_nav'

describe SatNav do
  let (:sat_nav) { SatNav.new(5, ["AB5", "BC4", "CD7", "DC8", "DE6", "AD5", "CE2", "EB3", "AE7"]) }

  it "knows all the junctions" do
    expect(sat_nav.junctions.keys).to eq(["A", "B", "C", "D", "E"])
  end

  it "knows the distance between A and B is 5" do
    expect(sat_nav.distance_of("AB")).to eq(5)
  end

  it "knows the distance between B and C is 4" do
    expect(sat_nav.distance_of("BC")).to eq(4)
  end

  # 1
  it "knows the distance of the journey A-B-C" do
    expect(sat_nav.distance_of("ABC")).to eq(9)
  end

  # 2
  it "knows the distance of journey A-D" do
    expect(sat_nav.distance_of("AD")).to eq(5)
  end

  # 3
  it "knows the distance of journey A-D-C" do
    expect(sat_nav.distance_of("AD")).to eq(5)
  end

  # 4
  it "knows the distance of journey A-E-B-C-D" do
    expect(sat_nav.distance_of("AEBCD")).to eq(21)
  end

  # 5
  it "knows there's no such route A-E-D" do
    expect{ sat_nav.distance_of("AED") }.to raise_error("NO SUCH ROUTE")
  end

  # 6
  it "knows the number of routes between C and C, with max 3 junctions" do
    expect(sat_nav.number_of_routes_between("C", "C", max_junctions: 3)).to eq(2)
  end

  # 7
  it "knows the number of routes between A and C with exactly 4 junctions" do
    expect(sat_nav.number_of_routes_between("A", "C", junctions: 4)).to eq(3)
  end

  # 8
  it "knows the length of the shortest route between A and C" do
    expect(sat_nav.shortest_route_between("A","C")).to eq(9)
  end

  # 9
  it "knows the length of the shortest route between C and C" do
    expect(sat_nav.shortest_route_between("C", "C")).to eq(9)
  end

  # 10
  it "knows the number of different routes from C to C with a distance of less than 30" do
    expect(sat_nav.number_of_routes_between("C", "C", max_distance: 30)).to eq(9)
  end
end