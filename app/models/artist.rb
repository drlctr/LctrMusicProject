class Artist < ActiveRecord::Base
	has_many :albums, :depenent => :nullify

  validates :name, presence:  true

end
