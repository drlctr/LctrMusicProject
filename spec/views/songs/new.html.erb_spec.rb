require 'spec_helper'

describe "songs/new" do
  before(:each) do
    assign(:song, stub_model(Song,
      :song_title => "MyString",
      :track => 1,
      :duration => 1,
      :path => "MyString",
      :filename => "MyString",
      :composer => "MyString"
    ).as_new_record)
  end

  it "renders new song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", songs_path, "post" do
      assert_select "input#song_song_title[name=?]", "song[song_title]"
      assert_select "input#song_track[name=?]", "song[track]"
      assert_select "input#song_duration[name=?]", "song[duration]"
      assert_select "input#song_path[name=?]", "song[path]"
      assert_select "input#song_filename[name=?]", "song[filename]"
      assert_select "input#song_composer[name=?]", "song[composer]"
    end
  end
end
