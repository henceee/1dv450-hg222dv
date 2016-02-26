class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, null: false
      t.timestamps null: false
    end
  end
end
