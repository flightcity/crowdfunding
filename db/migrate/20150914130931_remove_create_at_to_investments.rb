class RemoveCreateAtToInvestments < ActiveRecord::Migration
  def change
    remove_column :investments, :create_at
  end
end
