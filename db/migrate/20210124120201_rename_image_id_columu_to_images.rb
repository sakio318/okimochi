class RenameImageIdColumuToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :image_id, :photo_id
  end
end
