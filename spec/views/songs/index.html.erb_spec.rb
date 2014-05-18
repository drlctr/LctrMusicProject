require 'spec_helper'

describe "songs/index" do

  it "renders a list of songs" do

    assign(:songs, [Song.new(
        :id => 1,
        :song_title => "Song Title",
        :track => 1,
        :duration => 2,
        :path => "Path",
        :filename => "Filename",
        :composer => "Composer")])

    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should include( "Song Title")
    rendered.should include("Artist")
    rendered.should include("1")
    rendered.should include("00:00:02")
    rendered.should include("Genre")
    rendered.should include("Path")
    rendered.should include("Filename")
    rendered.should include("Composer")
    rendered.should include("Musicians")
  end
end
