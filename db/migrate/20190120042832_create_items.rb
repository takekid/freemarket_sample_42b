class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string       :name,          null: false,index: true
      t.text         :introduction,  null: false
      t.references   :category,      foreign_key: true
      t.references   :size,          foreign_key: true
      t.references   :brand,         foreign_key: true
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
