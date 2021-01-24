class CreateItemSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :item_situations do |t|
      t.references  :item,  null: false,  index: true, foreign_key: true
      t.references  :situation,  null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
