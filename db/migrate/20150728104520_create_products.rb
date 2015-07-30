class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :body
      t.integer :target_price, null: false
      t.integer :current_price, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.boolean :deleted, null: false,  default: false

      t.timestamps null: false
    end
  end
end
