class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.string :office_type
      t.string :privacy_type
      t.integer :capacity
      t.integer :boards_number
      t.integer :meeting_room
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_wifi
      t.boolean :is_tv
      t.boolean :is_locker
      t.boolean :is_pet_friendly
      t.boolean :is_coffee
      t.boolean :is_heating
      t.boolean :is_air
      t.boolean :is_kitchen
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
