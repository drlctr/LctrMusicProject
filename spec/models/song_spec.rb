require 'spec_helper'

describe Song do

  let(:test_good){Song.new(song_title: "Title", track: 1, duration: 1, path: "path", filename: "filename")}
  let(:test_no_title){Song.new(track: 1, duration: 1, path: "path", filename: "filename")}
  let(:test_neg_track){Song.new(song_title: "Title", track: -1, duration: 1, path: "path", filename: "filename")}
  let(:test_neg_dur){Song.new(song_title: "Title", track: 1, duration: 0, path: "path", filename: "filename")}
  let(:test_no_path){Song.new(song_title: "Title", track: 1, duration: 1, filename: "filename")}
  let(:test_no_fname){Song.new(song_title: "Title", track: 1, duration: 1, path: "path")}
  let(:test_float_track){Song.new(song_title: "Title", track: 1.5, duration: 1, path: "path", filename: "filename")}
  let(:test_float_dur){Song.new(song_title: "Title", track: 1, duration: 1.5, path: "path", filename: "filename")}

  context "Testing correct validation" do

  	it "must correctly validate a good record" do
  	expect(test_good.valid?).to be_true
    end  
  end

  context "testing song title validation" do

  	it "must have a song title" do
  		expect(test_no_title.valid?).to be_false
  	end
  end

  context "Testing track number validation" do
  	
  	it "must not have a negative track value" do
  	  expect(test_neg_track.valid?).to be_false
    end

    it "must not have a non-integer track number" do
    	expect(test_float_track.valid?).to be_false
    end
  end

  context "Testing duration validation" do

  	it "must not have a negative duration" do
  		expect(test_neg_dur.valid?).to be_false
  	end

  	it "must not have a non-integer duration" do
  		expect(test_float_dur.valid?).to be_false
  	end
  end

  context "Testing path and filename info" do

  	it "must have a path" do
  		expect(test_no_path.valid?).to be_false
  	end

  	it "must have a filename" do
  		expect(test_no_fname.valid?).to be_false
  	end
  end

end
