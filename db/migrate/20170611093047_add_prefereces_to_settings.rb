class AddPreferecesToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :preferences, :text
  end
end
