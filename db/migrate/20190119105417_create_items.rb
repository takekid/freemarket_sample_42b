class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string       :name,          null: false,index: true
      t.text         :introduction,  null: false
      t.integer      :brand_id,      null: false,foreign_key: true
      t.integer      :category_id,   null: false,foreign_key: true
      t.integer      :size_id,       null: false,foreign_key: true
      t.integer      :brand_id,      null: false,foreign_key: true
      t.text         :condition,     null: false
      t.string       :shippingfee,   null: false
      t.string       :shipfrom,      null: false
      t.string       :shipping_date, null: false
      t.string       :price,         null: false
      t.string       :status,        null: false
      t.integer      :buyer_id,      null: true
      t.integer      :seller_id,     null: false

      t.timestamps

    end
  end
end
