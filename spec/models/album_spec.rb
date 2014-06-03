require 'spec_helper'

describe Album do

  context "When validating an album record, it" do

    it "should recognize a good record" do
      expect(FactoryGirl.create(:album).valid?).to be_true
    end

    it "should have an album title" do
    	expect(FactoryGirl.build(:album, album_title: "").valid?).to be_false
    end

    it "should have an album genre" do
    	expect(FactoryGirl.build(:album, genre: "").valid?).to be_false
    end
  end
  
end