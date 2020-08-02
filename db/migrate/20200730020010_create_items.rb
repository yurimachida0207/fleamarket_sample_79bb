class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :description
      t.string :brand
      t.string :condition
      t.string :postage_payer
      t.string :ship_from
      t.string :price
      t.integer :seller
      t.integer :buyer
      t.text :image

      t.timestamps
    end
  end
end
# |item_name|string|null: false|
# |description|text|null: false|
# |brand|string|null: false|
# |condition|string|null: false|
# |postage_payer|string|null: false|
# |ship_from|string|null: false|
# |price|string|null: false|
# |seller|integer|null: false|
# |buyer|integer||
