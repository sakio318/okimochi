class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,       null: false
      t.string :shop_name,  null: false
      t.text :url
      t.boolean :packing,   null: false, default: true
      t.text :introduction
      t.integer :user_id,   null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
