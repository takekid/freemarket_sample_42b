class RemoveStatusFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :status
      end

  def down
    add_column :items, :status, :string
  end
end
