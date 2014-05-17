json.array!(@songs) do |song|
  json.extract! song, :id, :song_title, :track, :duration, :path, :filename, :composer
  json.url song_url(song, format: :json)
end
