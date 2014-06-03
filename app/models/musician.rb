class Musician < ActiveRecord::Base
	has_many :sessions
	has_many :abilities
	has_many :songs, through: :sessions
	has_many :instruments, through: :abilities

  validates :last_name, presence:  true

end
