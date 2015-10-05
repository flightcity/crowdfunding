class ChangeColumnToProductImages < ActiveRecord::Migration
  def change
    remove_column :product_images, :product_id
    change_table :product_images do |t|
      t.references :product, index: true, foreign_key: true
    end
  end
end
