require 'spec_helper'

describe Instrument do

  let(:test_good){Instrument.new(name: "Name")}
  let(:test_no_name){Instrument.new()}
  
  context "When validating an instrument record, it" do

    it "should recognize a good record" do
      expect(test_good.valid?).to be_true
    end

    it "should have a name" do
    	expect(test_no_name.valid?).to be_false
    end
  end

end
