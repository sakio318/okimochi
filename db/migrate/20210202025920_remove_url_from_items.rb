class RemoveUrlFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :url
  end

  def down
    add_column :items, :url, :text
  end
end
