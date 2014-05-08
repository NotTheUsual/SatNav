require 'junction'

describe Junction do
  let (:a) { Junction.new("A", ["AB4", "AD3"]) }
  let (:b) { Junction.new("B") }
  let (:d) { Junction.new("D") }
  let (:e) { Junction.new("E") }

  it "has a name" do
    expect(a.name).to eq("A")
  end
  
  it "knows the distance to another junction when seeded instructions" do
    expect(a.to(b)).to eq(4)
  end

  it "knows the distance to multiple junctions" do
    expect(a.to(b)).to eq(4)
    expect(a.to(d)).to eq(3)
  end

  it "knows where it can access" do
    expect(a.can_access?(b)).to be_true
    expect(a.can_access?(e)).to be_false
  end

  it "knows everywhere it can access" do
    expect(a.accessible).to eq(["B", "D"])
  end
end