# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.create [
	{:song_title => "New Day Rising", :track => 1, :duration => 154, :path => "~/music/Husker Du/", :filename => "new_day_rising.mp3", :composer => "Mould", :album_id => 1},
	{:song_title => "Powerline", :track => 10, :duration => 144, :path => "~/music/Husker Du/", :filename => "powerline.mp3", :composer => "Mould", :album_id => 1},
 	{:song_title => "Rael Rean", :track => 3, :duration => 204, :path => "~/music/999/", :filename => "rael_rean.mp3", :composer => "Day", :album_id => 2},
 	{:song_title => "Momentum", :track => 2, :duration => 207, :path => "~/music/Aimee Mann/", :filename => "momentum", :composer => "Mann", :album_id => 3},
 	{:song_title => "Driving Sideways", :track => 9, :duration => 229, :path => "~/music/Aimee Mann/", :filename => "driving_sideways.mp3", :composer => "Mann", :album_id => 6},
 	{:song_title => "Begin the Beguine", :track => 7, :duration => 177, :path => "~/music/Frank Sinatra/", :filename => "begin_the_beguine.mp3", :composer => "Porter", :album_id => 4},
 	{:song_title => "Concerto in F:  I.  Allegro", :track => 1, :duration => 776, :path => "~/music/Gershwin/", :filename => "Concerto_in_f_I.allegro.mp3", :composer => "Gershwin", :album_id => 5}]

Album.create [
	{:album_title => "New Day Rising", :year => "1985", :genre => "Post-punk", :protected => 0, :artist_id => 1},
	{:album_title => "Separates", :year => "1978", :genre => "Punk", :protected => 1, :artist_id => 3},
	{:album_title => "Magnolia", :year => "1999", :genre => "Singer-songwriter", :protected => 1, :artist_id => 2},
	{:album_title => "The Best of the Capital Years, vol. 3", :year => "2010", :genre => "Songbook", :protected => 0, :artist_id => 4},
	{:album_title => "Concerto in F", :year => "1925", :genre => "Classical", :protected => 0, :artist_id => 5},
  {:album_title => "Bachelor No. 2", :year => "2000", :genre => "Singer-songwriter", :protected => 1, :artist_id => 2}] 	

Artist.create [
	{:name => "Husker Du", :nationality => "USA"},
	{:name => "Aimee Mann", :nationality => "USA"},
	{:name => "999", :nationality => "UK"},
	{:name => "Frank Sinatra", :nationality => "USA"},
	{:name => "Leonard Bernstein", :nationality => "USA"}]

Musician.create [
	{:first_name => "Bob", :last_name => "Mould", :born => "1960"},
	{:first_name => "Grant", :last_name => "Hart", :born => "1961"},
	{:first_name => "Greg", :last_name => "Norton", :born => "1959"},
	{:first_name => "Aimee", :last_name => "Mann", :born => "1960"},
	{:first_name => "Nick", :last_name => "Cash", :born => ""},
	{:first_name => "Guy", :last_name => "Days", :born => ""},
	{:first_name => "Pablo", :last_name => "LaBritain", :born => ""},
	{:first_name => "John", :last_name => "Watson", :born => ""},
	{:first_name => "Frank", :last_name => "Sinatra", :born => "1915"},
	{:first_name => "Leonard", :last_name => "Bernstein", :born => "1918"}]

Session.create [
  {:song_id => 1, :musician_id => 1},
  {:song_id => 1, :musician_id => 2},
	{:song_id => 1, :musician_id => 3},
  {:song_id => 2, :musician_id => 1},
  {:song_id => 2, :musician_id => 2},
	{:song_id => 2, :musician_id => 3},
	{:song_id => 3, :musician_id => 4},
	{:song_id => 4, :musician_id => 5},
	{:song_id => 4, :musician_id => 6},
	{:song_id => 4, :musician_id => 7},
	{:song_id => 4, :musician_id => 8},
	{:song_id => 5, :musician_id => 4},
	{:song_id => 6, :musician_id => 9},
	{:song_id => 7, :musician_id => 10}]

Instrument.create [
	{:name => "Vocals"},
	{:name => "Guitar"},
	{:name => "Guitar - Lead"},
	{:name => "Guitar - Rhythm"},
	{:name => "Bass"},
	{:name => "Drums"},
	{:name => "Keyboards"},
	{:name => "Conductor"}]

Ability.create [
	{:musician_id =>1, :instrument_id => 1},
	{:musician_id =>1, :instrument_id => 2},
	{:musician_id =>2, :instrument_id => 1},
	{:musician_id =>2, :instrument_id => 6},
	{:musician_id =>3, :instrument_id => 5},
	{:musician_id =>4, :instrument_id => 1},
	{:musician_id =>4, :instrument_id => 4},
	{:musician_id =>4, :instrument_id => 7},
	{:musician_id =>5, :instrument_id => 1},
	{:musician_id =>5, :instrument_id => 2},
	{:musician_id =>6, :instrument_id => 3},
	{:musician_id =>7, :instrument_id => 6},
	{:musician_id =>8, :instrument_id => 5},
	{:musician_id =>9, :instrument_id => 1},
	{:musician_id =>10, :instrument_id => 8}]