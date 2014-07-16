class CreateEventgroups < ActiveRecord::Migration
  def change
    create_table :eventgroups do |t|
      t.string :groupName, null:false
      t.binary :groupDescription
      t.binary :groupPhoto

      t.timestamps
    end
    add_index :eventgroups, :groupName, unique: true
  end
end
