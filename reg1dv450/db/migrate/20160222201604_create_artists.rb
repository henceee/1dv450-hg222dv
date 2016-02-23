class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.timestamps null: false
      t.belongs_to :show
    end
  end
end
