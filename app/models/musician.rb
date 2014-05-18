class Musician < ActiveRecord::Base
	has_many :sessions
	has_many :songs, through: :sessions

  validates :last_name, presence:  true
  #validates_date "1/1/1960"
  #validates_date "1/1/1960", :on_or_before => lambda{Date.current}

end
