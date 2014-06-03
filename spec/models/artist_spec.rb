require 'spec_helper'

describe Artist do

	before :each do
    @artist = FactoryGirl.create(:artist)
    @invalid_artist = FactoryGirl.build(:invalid_artist)
  end
  
  context "When validating the artist, it" do

  	it "should recognize a good artist record" do
  		expect(@artist.valid?).to be_true
  	end

  	it "shouild have an artist's name" do
  		expect(@invalid_artist.valid?).to be_false
  	end
  end

end
