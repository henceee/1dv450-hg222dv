class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.belongs_to :creator, index:true
      t.belongs_to :creator
      t.belongs_to :venue, index:true
      t.belongs_to :venue
      
      t.string :name
      t.string :description
      t.timestamps null: false
    end
  end
end
