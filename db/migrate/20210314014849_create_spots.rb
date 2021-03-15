class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :address, null: :false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
