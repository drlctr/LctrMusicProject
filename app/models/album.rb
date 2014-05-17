class Album < ActiveRecord::Base

validates :album_title, presence: true
validates :genre, presence: true

end
