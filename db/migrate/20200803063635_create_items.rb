class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :description, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.string :condition, null: false
      t.string :postage_payer, null: false
      t.string :ship_from, null: false
      t.string :ship_preparation, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
