class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :description, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.string :condition
      t.string :postage_payer
      t.string :ship_from
      t.string :ship_preparation
      t.integer :price, null: false
      t.timestamps
    end
  end
end
