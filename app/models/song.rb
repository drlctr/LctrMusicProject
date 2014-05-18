class Song < ActiveRecord::Base

	belongs_to :album

validates :song_title, presence:  true
validates :track, 
	:numericality => {:greater_than => 0, :only_integer => true}
validates :duration,
	:numericality => {:greater_than => 0, :only_integer => true}
validates :path, presence:  true
validates :filename, presence: true

def durationmin 
	hr = (self.duration.to_f/3600).truncate
	min = (self.duration.modulo(3600)/60).truncate
	sec = self.duration.modulo(60)
	rtn = "#{format('%02d',hr)}:#{format('%02d',min)}:#{format('%02d',sec)}"
end



end
