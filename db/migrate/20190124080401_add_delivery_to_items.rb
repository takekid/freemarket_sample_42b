class AddDeliveryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery, :string, null:false
  end
end
