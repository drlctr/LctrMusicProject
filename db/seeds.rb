# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.create [
	{:song_title => "New Day Rising", :track => 1, :duration => 154, :path => "~/music/Husker Du/", :filename => "new_day_rising.mp3", :composer => "Mould"},
	{:song_title => "Powerline", :track => 10, :duration => 144, :path => "~/music/Husker Du/", :filename => "powerline.mp3", :composer => "Mould"},
 	{:song_title => "Rael Rean", :track => 3, :duration => 204, :path => "~/music/999/", :filename => "rael_rean.mp3", :composer => "Day"},
 	{:song_title => "Momentum", :track => 2, :duration => 207, :path => "~/music/Aimee Mann/", :filename => "momentum", :composer => "Mann"},
 	{:song_title => "Driving Sideways", :track => 9, :duration => 229, :path => "~/music/Aimee Mann/", :filename => "driving_sideways.mp3", :composer => "Mann"},
 	{:song_title => "Begin the Beguine", :track => 7, :duration => 177, :path => "~/music/Frank Sinatra/", :filename => "begin_the_beguine.mp3", :composer => "Porter"},
 	{:song_title => "Concerto in F:  I.  Allegro", :track => 1, :duration => 776, :path => "~/music/Gershwin/", :filename => "Concerto_in_f_I.allegro.mp3", :composer => "Gershwin"},]

Album.create [
	{:album_title => "New Day Rising", :year => "1985", :genre => "Post-punk", :protected => 0, :artist_id => 1},
	{:album_title => "Separates", :year => "1978", :genre => "Punk", :protected => 1, :artist_id => 3},
	{:album_title => "Magnolia", :year => "1999", :genre => "Singer-songwriter", :protected => 1, :artist_id => 2},
	{:album_title => "The Best of the Capital Years, vol. 3", :year => "2010", :genre => "Songbook", :protected => 0, :artist_id => 4},
	{:album_title => "Concerto in F", :year => "1925", :genre => "Classical", :protected => 0, :artist_id => 5}] 	

Artist.create [
	{:name => "Husker Du", :nationality => "USA"},
	{:name => "Aimee Mann", :nationality => "USA"},
	{:name => "999", :nationality => "UK"},
	{:name => "Frank Sinatra", :nationality => "USA"},
	{:name => "Leonard Bernstein", :nationality => "USA"}]