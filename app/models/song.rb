class Song < ActiveRecord::Base

	belongs_to :album
	has_many :sessions
	has_many :musicians, through: :sessions
	has_many :instruments, through: :musicians

  validates :song_title, presence:  true
  validates :track, 
	  :numericality => {:greater_than => 0, :only_integer => true}
  validates :duration,
	  :numericality => {:greater_than => 0, :only_integer => true}
  validates :path, presence:  true
  validates :filename, presence: true

  def durationmin 
	  min = (self.duration/60).truncate
	  sec = self.duration.modulo(60)
	  rtn = "#{format('%02d',min)}:#{format('%02d',sec)}"
  end

end