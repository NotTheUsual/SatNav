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

  it "knows the distance of the journey A-B-C" do
    expect(sat_nav.distance_of("ABC")).to eq(9)
  end
end