require 'spec_helper'

describe Instrument do

  context "When validating an instrument record, it" do

    it "should recognize a good record" do
      expect(FactoryGirl.create(:instrument).valid?).to be_true
    end

    it "should have a name" do
    	expect(FactoryGirl.build(:instrument, name: "").valid?).to be_false
    end
  end

end
