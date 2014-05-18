class Ability < ActiveRecord::Base
	belongs_to :instrument
	belongs_to :musician

	validates :instrument_id, presence: true
	validates :instrument_id, 
		:numericality => {:greater_than => 0, :only_integer => true}
	validates :musician_id, presence: true
	validates :musician_id, 
		:numericality => {:greater_than => 0, :only_integer => true}
end
