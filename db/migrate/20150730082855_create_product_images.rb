class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :product_id, null: false
      t.string :title, null: false
      t.string :image_uid
      t.string :image_name
      t.boolean :deleted, null: false,  default: false

      t.timestamps null: false
    end
  end
end
