class RenameTitleColumnToContacts < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :title, :name
  end
end
