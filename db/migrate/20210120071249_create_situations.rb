class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.string :situation,  null: false

      t.timestamps
    end
  end
end
