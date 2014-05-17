class FixMusicianName < ActiveRecord::Migration
  def change
  	rename_column :musicians, :name, :first_name
  end
end
