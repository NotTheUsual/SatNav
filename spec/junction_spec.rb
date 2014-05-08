require 'junction'

describe Junction do
  it "has a name" do
    a = Junction.new("A")
    expect(a.name).to eq("A")
  end
  
  it "knows the distance to another junction when seeded instructions" do
    a = Junction.new("A", ["AB4"])
    expect(a.to("B")).to eq(4)
  end

  it "knows the distance to multiple junctions" do
    a = Junction.new("A", ["AB4", "AD3"])
    expect(a.to("B")).to eq(4)
    expect(a.to("D")).to eq(3)
  end

  it "knows where it can access" do
    a = Junction.new("A", ["AB4"])
    expect(a.can_access?("B")).to be_true
    expect(a.can_access?("E")).to be_false
  end
end