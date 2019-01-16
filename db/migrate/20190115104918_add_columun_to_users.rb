class AddColumunToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name,          :string,   null: false, default: ""
  	add_column :users, :kana_name,     :string,   null: false, default: ""
  	add_column :users, :nickname,      :string,   index: true, null: false, unique: true
  	add_column :users, :avater,        :text  
  end
end
