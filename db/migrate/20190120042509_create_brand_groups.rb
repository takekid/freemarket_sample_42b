class CreateBrandGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_groups do |t|
      t.references    :brand, foreign_key: true

      t.timestamps
    end
  end
end
