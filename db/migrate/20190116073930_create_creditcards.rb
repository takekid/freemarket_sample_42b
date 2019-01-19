class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|
      t.references   :user,     foreign_key: true
      t.integer      :token_id, null: false
      t.timestamps
    end
  end
end