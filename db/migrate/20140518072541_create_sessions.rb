class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :song_id
      t.integer :musician_id

      t.timestamps
    end
  end
end
