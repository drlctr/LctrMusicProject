require 'spec_helper'

describe "songs/index" do

    before :each do

        @album = FactoryGirl.create(:album)
        @song = FactoryGirl.create(:song, album: @album)
    end

  it "renders a list of songs" do

    assign(:songs, [@song])

    render

    rendered.should include ("Test_song")
    rendered.should include ("1")
    rendered.should include ("Test_album")
    rendered.should include ("03:00")
    rendered.should include ("Testers")
    rendered.should include ("/test/path")
    rendered.should include ("test_file.mp3")
    rendered.should include ("test_composer")

  end
end
