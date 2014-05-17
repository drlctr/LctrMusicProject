class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_title
      t.integer :track
      t.integer :duration
      t.string :path
      t.string :filename
      t.string :composer

      t.timestamps
    end
  end
end
