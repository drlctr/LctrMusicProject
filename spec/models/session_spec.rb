require 'spec_helper'

describe Session do
  
  let(:test_good){Session.new(song_id: 1, musician_id:1)}
  let(:test_bad_song_id){Session.new(song_id: "A", musician_id:1)}
  let(:test_missing_song_id){Session.new(musician_id:1)}
  let(:test_bad_musician_id){Session.new(song_id: 1, musician_id:"B")}
  let(:test_missing_musician_id){Session.new(song_id: 1)}

  context "When validating the session, it" do

  	it "should validate a correct record" do
  		expect(test_good.valid?).to be_true
  	end

  	it "should ensure that the song_id is an integer" do
  	  expect(test_bad_song_id.valid?).to be_false
  	end

  	it "should ensure that there is a song_id" do
  		expect(test_missing_song_id.valid?).to be_false
  	end

  	it "should ensure that the musician_id is an integer" do
  	  expect(test_bad_musician_id.valid?).to be_false
  	end

  	it "should ensure that there is a musician_id" do
  		expect(test_missing_musician_id.valid?).to be_false
  	end
  end	
end
