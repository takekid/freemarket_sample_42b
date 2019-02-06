class RenameTokenIdToCustomerTokenCreditcards < ActiveRecord::Migration[5.2]
  def change
    rename_column :creditcards, :customer_id, :customer_token
  end
end
