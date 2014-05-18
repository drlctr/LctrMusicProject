require 'spec_helper'

describe Album do

  let (:test_good){Album.new(album_title: "Title", genre: "Music")}
  let(:test_no_title){Album.new(genre: "Music")}
  let(:test_no_genre){Album.new(album_title: "Title")}

  context "When validating an album record, it" do

    it "should recognize a good record" do
      expect(test_good.valid?).to be_true
    end

    it "should have an album title" do
    	expect(test_no_title.valid?).to be_false
    end

    it "should have an album genre" do
    	expect(test_no_genre.valid?).to be_false
    end
  end
  
end