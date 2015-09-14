class ChangeColumnToInvestments < ActiveRecord::Migration
  def change
    remove_column :investments, :product_id
    remove_column :investments, :user_id
    change_table :investments do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
