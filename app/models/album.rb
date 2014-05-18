class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :songs, :dependent => :destroy

  validates :album_title, presence: true
  validates :genre, presence: true

end