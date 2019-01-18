class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references  :user,        foreign_key: true
      t.integer     :postal_code, null: false
      t.string      :prefectures, null: false
      t.string      :city,        null: false
      t.string      :address,     null: false
      t.string      :building,    null: true
      t.string      :phonenumber, null: true, unique: true
      t.timestamps
    end
  end
end
