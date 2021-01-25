class ChangeImagesToPostImages < ActiveRecord::Migration[5.2]
  def change
    rename_table :images, :post_images
  end
end
