class RenameTokenIdToCustomerTokenCreditcards < ActiveRecord::Migration[5.2]
  def change
    rename_column :creditcards, :token_id, :customer_token
  end
end
