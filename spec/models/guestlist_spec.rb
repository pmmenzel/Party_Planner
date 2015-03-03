require 'rails_helper'

describe Guestlist do
	it { should have_one :event}
	it { should have_many :users}
	it { should_not have_many :items}
end

describe "Guestlist Count" do
	before(:each) do
		Guestlist.destroy_all
	end

	context "Empty Guestlists Table " do
		it "should not have any Guestlists" do
			guestlists =  Guestlist.all
			expect(guestlists.length).to eq(0)
		end
	end

	context "New Guestlist" do
		it "should create Guestlist record" do
			guestlists =  Guestlist.all
			guestlist = Guestlist.create()
			expect(guestlists.length).to eq(1)
		end
	end
end
