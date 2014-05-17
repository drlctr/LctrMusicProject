require 'spec_helper'

describe "songs/show" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :song_title => "Song Title",
      :track => 1,
      :duration => 2,
      :path => "Path",
      :filename => "Filename",
      :composer => "Composer"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Song Title/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Path/)
    rendered.should match(/Filename/)
    rendered.should match(/Composer/)
  end
end
