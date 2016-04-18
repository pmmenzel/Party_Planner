require 'spec_helper'

# RSpec.describe Item, type: :model do

describe Item do
  it { should belong_to :event}
  # it { should_not belong_to :user}
  it { should_not belong_to :guestlist}
end

describe "Item Count" do
  before(:each) do
    Item.destroy_all
  end

  context "Empty Items Table " do
    it "should not have any Items" do
      items =  Item.all
      expect(items.length).to eq(0)
    end
  end

  # context "New Item" do
  #   it "should create Item record" do
  #     items =  Item.all
  #     item = Item.create(name: "Hot dogs")
  #     expect(items.length).to eq(1)
  #   end
  # end
end


# end
