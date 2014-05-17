require 'spec_helper'

describe "songs/edit" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :song_title => "MyString",
      :track => 1,
      :duration => 1,
      :path => "MyString",
      :filename => "MyString",
      :composer => "MyString"
    ))
  end

  it "renders the edit song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", song_path(@song), "post" do
      assert_select "input#song_song_title[name=?]", "song[song_title]"
      assert_select "input#song_track[name=?]", "song[track]"
      assert_select "input#song_duration[name=?]", "song[duration]"
      assert_select "input#song_path[name=?]", "song[path]"
      assert_select "input#song_filename[name=?]", "song[filename]"
      assert_select "input#song_composer[name=?]", "song[composer]"
    end
  end
end
