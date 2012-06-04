class AddMoreColumsToTips < ActiveRecord::Migration
  def change
    add_column :tips, :name, :string
    add_column :tips, :twitter_id, :string
  end

  def down
    remove_column :tips, :name
    remove_column :tips, :twitter_id
  end
end
