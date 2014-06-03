require 'spec_helper'

describe "albums/index" do

  before :each do

    @artist = FactoryGirl.create(:artist)
    @album = FactoryGirl.create(:album, artist: @artist)
  end

  it "renders a list of albums" do
    
    assign(:albums, [@album])

    render

    rendered.should include ("Test_album")
    rendered.should include ("Test_genre")
    rendered.should include ("Testers")
    rendered.should include ("1988")
    rendered.should include ("false")
  end
end
