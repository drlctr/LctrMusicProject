class AddLastNameToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :last_name, :string
  end
end
