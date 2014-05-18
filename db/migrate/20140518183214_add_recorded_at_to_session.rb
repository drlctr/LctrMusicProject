class AddRecordedAtToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :recorded_at, :string
  end
end
