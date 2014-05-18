require 'spec_helper'

describe Ability do
  
  let(:test_good){Ability.new(instrument_id: 1, musician_id:1)}
  let(:test_bad_instrument_id){Ability.new(instrument_id: "A", musician_id:1)}
  let(:test_missing_instrument_id){Ability.new(musician_id:1)}
  let(:test_bad_musician_id){Ability.new(instrument_id: 1, musician_id:"B")}
  let(:test_missing_musician_id){Ability.new(instrument_id: 1)}

  context "When validating the ability table, it" do

  	it "should validate a correct record" do
  		expect(test_good.valid?).to be_true
  	end

  	it "should ensure that the instrument_id is an integer" do
  	  expect(test_bad_instrument_id.valid?).to be_false
  	end

  	it "should ensure that there is a instrument_id" do
  		expect(test_missing_instrument_id.valid?).to be_false
  	end

  	it "should ensure that the musician_id is an integer" do
  	  expect(test_bad_musician_id.valid?).to be_false
  	end

  	it "should ensure that there is a musician_id" do
  		expect(test_missing_musician_id.valid?).to be_false
  	end
  end	
end
