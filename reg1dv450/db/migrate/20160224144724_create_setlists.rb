class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :show, index: true
      t.timestamps null: false
    end
  end
end
