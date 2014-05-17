class Musician < ActiveRecord::Base

  validates :last_name, presence:  true
  validates_date :born
  validates_date :born, :on_or_before => lambda{Date.current}

end
