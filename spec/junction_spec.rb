require 'junction'

describe Junction do
  context "(when initialised)" do
    it "has a name" do
      a = Junction.new("A")
      expect(a.name).to eq("A")
    end
  end
  
end