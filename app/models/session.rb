class Session < ActiveRecord::Base
	belongs_to :song
	belongs_to :musician

	validates :song_id, presence: true
	validates :song_id, 
		:numericality => {:greater_than => 0, :only_integer => true}
	validates :musician_id, presence: true
	validates :musician_id, 
		:numericality => {:greater_than => 0, :only_integer => true}

end
