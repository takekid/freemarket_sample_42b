class CreateProceeds < ActiveRecord::Migration[5.2]
  def change
    create_table :proceeds do |t|
      t.integer     :proceed, null: false
      t.integer     :point,   null: true
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end


