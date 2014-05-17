require 'spec_helper'

describe Artist do

	let(:test_good){Artist.new(name:"Name", nationality:"country")}
	let(:test_no_name){Artist.new(nationality: "Country")}
  
  context "When validating the artist, it" do

  	it "should recognize a good artist record" do
  		expect(test_good).to be_true
  	end

  	it "shouild have an artist's name" do
  		expect(test_no_name.valid?).to be_false
  	end
  end

end
