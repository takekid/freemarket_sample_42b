class RenameNameToSizeNameSizes < ActiveRecord::Migration[5.2]
  def change
    rename_column :sizes, :name, :size_name
  end
end
