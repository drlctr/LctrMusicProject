class AddProtectedToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :protected, :boolean
  end
end
