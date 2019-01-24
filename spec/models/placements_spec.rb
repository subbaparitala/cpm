RSpec.describe Placement, :type => :model do
  
  before(:all) do
    @placement = create(:placement)
    @deliveries = create_list(:delivery, 10)
  end
  
  it "is valid with valid attributes" do
    expect(@placement).to be_valid
  end

  it "should give sum of deliveries " do 
    result = Placement.sum_of_impression
    expect(result[0][4]).to eq 3690
  end

  it "should give sum in between dates" do 
    result = Placement.search(4.days.ago, Date.today)
    expect(result[:total]).to eq 18.45
  end

  describe "Associations" do 
    it "has one buyer" do
      assc = described_class.reflect_on_association(:deliveries)
      expect(assc.macro).to eq :has_many
    end
  end
end