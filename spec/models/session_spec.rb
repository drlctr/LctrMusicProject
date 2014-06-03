require 'spec_helper'

describe Session do

  context "When validating the session, it" do

  	it "should validate a correct record" do
  		expect(FactoryGirl.create(:session).valid?).to be_true
  	end

  	it "should ensure that the song_id is an integer" do
  	  expect(FactoryGirl.build(:session, song_id: "A").valid?).to be_false
  	end

  	it "should ensure that there is a song_id" do
  		expect(FactoryGirl.build(:session, song_id: "").valid?).to be_false
  	end

  	it "should ensure that the musician_id is an integer" do
  	  expect(FactoryGirl.build(:session, musician_id: "A").valid?).to be_false
  	end

  	it "should ensure that there is a musician_id" do
  		expect(FactoryGirl.build(:session, musician_id: "").valid?).to be_false
  	end
  end	
end
