FactoryGirl.define do 

	factory :musician do
		#instrument
		first_name 	'John'
		last_name		'Smith'
		born				'1962'
	end

	factory :artist do
		name        'Testers'
		nationality	'USA'
	end

	factory :invalid_artist, parent: :artist do
		name        ''
		nationality 'Invalid'
	end

	factory :album do
		artist
		id          '1'
		album_title	'Test_album'
		year        '1988'
		genre       'Test_genre'
		protected   'false'
	end

	factory :invalid_album, parent: :album do
		album_title ''
		genre       'Invalid_genre'
	end

	factory :song do
		song_title  'Test_song'
		track       '1/10'
		duration    '180'
		path        '/test/path'
		filename    'test_file.mp3'
		composer    'test_composer'
	end

	factory :invalid_song, parent: :song do
		song_title ''
		track      'Invalid'
	end

	factory :user do
		email       'test@test.com'
		password    '123456'
	end

	factory :ability do
		instrument_id  1
		musician_id    1
	end

	factory :instrument do
		name           'Test_guitar'
	end

	factory :session do
		musician_id    1
		song_id        1
	end

end