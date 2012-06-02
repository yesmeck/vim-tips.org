class AddUrlToTips < ActiveRecord::Migration
  def change
    add_column :tips, :url, :string
  end

  def down
    remove_colum :tips, :url
  end
end
