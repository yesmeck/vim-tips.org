class AddUrlToTips < ActiveRecord::Migration
  def change
    add_column :tips, :url, :string
  end

  def down
    remove_column :tips, :url
  end
end
