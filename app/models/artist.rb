class Artist < ActiveRecord::Base
	has_many :albums, :dependent => :nullify

  validates :name, presence:  true

end
