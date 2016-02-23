class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venueName
      t.float :latitude
      t.float :longitude
      t.string :adress
      t.timestamps null: false
    end
  end
end
