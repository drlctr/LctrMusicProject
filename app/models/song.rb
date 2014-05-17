class Song < ActiveRecord::Base

validates :song_title, presence:  true
validates :track, 
	:numericality => {:greater_than => 0, :only_integer => true}
validates :duration,
	:numericality => {:greater_than => 0, :only_integer => true}
validates :path, presence:  true
validates :filename, presence: true

end
