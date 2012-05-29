class AddMoreColumsToTips < ActiveRecord::Migration
  def change
    add_column :tips, :name, :string
    add_column :tips, :twitter_id, :string
  end

  def down
    remove_colum :tips, :name
    remove_colum :tips, :twitter_id
  end
end
