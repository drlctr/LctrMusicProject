FactoryGirl.define do 

	factory :instrument do
		name	'guitar'
	end

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
		#album
		song_title  'Test_song'
		track       '1/10'
		duration    '180'
		path        '/test/path'
		filename    'test_file.mp3'
		composer    'test_composer'
	end

	factory :user do
		email       'test@test.com'
		password    '123456'
	end

end