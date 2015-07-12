require 'rails_helper'

describe Event do
  it { should belong_to :user}
  it { should belong_to :guestlist}
  it { should have_many :items}
end

describe "Event Count" do
  before(:each) do
    Event.destroy_all
  end

  context "Empty Events Table " do
    it "should not have any Events" do
      events =  Event.all
      expect(events.length).to eq(0)
    end
  end

  # context "New Event" do
  #   it "should create Event record" do
  #     expect(event = Event.create()
  #     Event.reload
  #     expect(Event.count).to eq(1)
  #   end
  # end
end

