require 'spec_helper'

describe Event do
  it { should belong_to(:user) }
  it { should have_many :items }
end

describe "Event Count" do

  # context "New Event" do
  #   it "should create Event record" do
  #     expect(event = Event.create()
  #     Event.reload
  #     expect(Event.count).to eq(1)
  #   end
  # end
end

