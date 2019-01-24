require 'rails_helper'

RSpec.describe Delivery, :type => :model do

  subject { described_class.new(id: 1, placement_id: 1, date: Date.today, impressions: 369, created_at: DateTime.now, updated_at: DateTime.now) }

  it "is not valid with nil attributes" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a placement_id" do 
    subject.placement_id = nil 
    expect(subject).to_not be_valid
  end

  it "is not valid without a date" do 
    subject.date = nil 
    expect(subject).to_not be_valid
  end

  it "is not valid without a impressions" do 
    subject.impressions = nil 
    expect(subject).to_not be_valid
  end

  it "is not valid without placements record" do 
    subject.placement_id = nil
    expect(subject).to_not be_valid
  end

  it "is valid with placements record " do 
    placement = create(:placement)
    expect(subject).to be_valid
  end

  describe "Associations" do 
    it "has one buyer" do
      assc = described_class.reflect_on_association(:placement)
      expect(assc.macro).to eq :belongs_to
    end
  end
end