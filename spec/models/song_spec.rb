require 'spec_helper'

describe Song do

  before :each do
    @song = FactoryGirl.create(:song)
  end

  context "When testing the duration conversion, it" do

    it "must correctly convert sec to hr:min:sec" do
      expect(@song.durationmin).to eq("03:00")
    end
  end
  
  context "When testing correct song validation, it" do

  	it "must correctly validate a good record" do
  	expect(@song.valid?).to be_true
    end  
  end

  context "testing song title validation" do

  	it "must have a song title" do
  		expect(FactoryGirl.build(:song, song_title: "").valid?).to be_false
  	end
  end

  context "Testing duration validation" do

  	it "must not have a negative duration" do
  		expect(FactoryGirl.build(:song, duration: 0).valid?).to be_false
  	end

  	it "must not have a non-integer duration" do
  		expect(FactoryGirl.build(:song, duration: 1.5).valid?).to be_false
  	end
  end

  context "Testing path and filename info" do

  	it "must have a path" do
  		expect(FactoryGirl.build(:song, path: "").valid?).to be_false
  	end

  	it "must have a filename" do
  		expect(FactoryGirl.build(:song, filename: "").valid?).to be_false
  	end
  end

end
