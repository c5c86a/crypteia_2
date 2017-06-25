class CreateServers < ActiveRecord::Migration[5.1]
  def change
    create_table :servers do |t|

      t.timestamps
    end
  end
end
