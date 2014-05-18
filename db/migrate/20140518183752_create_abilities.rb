class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.integer :musician_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
