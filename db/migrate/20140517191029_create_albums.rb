class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_title
      t.string :year
      t.string :genre

      t.timestamps
    end
  end
end
