class Instrument < ActiveRecord::Base
	has_many :abilities
	has_many :musicians, through: :abilities

  validates :name, presence:  true

end
