class RemovePerentIdFromCategories < ActiveRecord::Migration[5.2]
   def up
    remove_column :categories, :perent_id
      end

  def down
    add_column :categories, :perent_id, :string
  end
end
