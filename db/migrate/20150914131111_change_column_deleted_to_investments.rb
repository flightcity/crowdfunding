class ChangeColumnDeletedToInvestments < ActiveRecord::Migration
  def change
    remove_column :investments, :deleted
    add_column :investments, :deleted_at, :datetime
  end
end
