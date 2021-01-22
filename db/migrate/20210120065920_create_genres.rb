class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
