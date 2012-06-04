class AddApprovedToTips < ActiveRecord::Migration
  def change
    add_column :tips, :approved, :boolean
  end

  def down
    remove_column :tips, :approved
  end
end
