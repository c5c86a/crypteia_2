class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|

      t.timestamps
    end
  end
end
