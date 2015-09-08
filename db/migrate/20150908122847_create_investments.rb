class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.integer :price
      t.string :comment
      t.datetime :create_at
      t.boolean :deleted, null: false,  default: false

      t.timestamps null: false
    end
  end
end
