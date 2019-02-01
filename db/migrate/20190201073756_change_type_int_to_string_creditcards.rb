class ChangeTypeIntToStringCreditcards < ActiveRecord::Migration[5.2]
  def change
    change_column :creditcards, :customer_token, :string
  end
end
