class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventType
      t.string :eventName
      t.string :locationAddress
      t.string :city
      t.string :country
      t.float :locationLat
      t.float :locationLon
      t.date :eventFromDate
      t.date :eventToDate
      t.binary :eventDesctiption
      t.binary :eventImage

      t.references :Eventgroup
      t.references :User
      t.timestamps
    end
      add_index :events, :eventName, :unique => true
  end
end
