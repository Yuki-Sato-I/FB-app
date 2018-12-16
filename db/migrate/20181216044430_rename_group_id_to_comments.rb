class RenameGroupIdToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :group_id, :post_id
  end
end
