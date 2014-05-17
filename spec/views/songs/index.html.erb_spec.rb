require 'spec_helper'

describe "songs/index" do
  before(:each) do
    assign(:songs, [
      stub_model(Song,
        :song_title => "Song Title",
        :track => 1,
        :duration => 2,
        :path => "Path",
        :filename => "Filename",
        :composer => "Composer"
      ),
      stub_model(Song,
        :song_title => "Song Title",
        :track => 1,
        :duration => 2,
        :path => "Path",
        :filename => "Filename",
        :composer => "Composer"
      )
    ])
  end

  it "renders a list of songs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Song Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Composer".to_s, :count => 2
  end
end
