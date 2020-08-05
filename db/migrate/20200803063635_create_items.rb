class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :description, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.integer :condition_id, null: false
      t.integer :postage_payer, null: false, default: 0
      t.integer :prefecture_id, null: false
      t.integer :preparation_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
# |Column|Type|Options|
# |------|----|-------|
# |item_name|string|null: false|
# |description|text|null: false|
# |brand|string||
# |condition|string|null: false|
# |postage_payer|string|null: false|
# |ship_from|string|null: false|
# |ship_preparation|string|null: false|
# |price|string|null: false|
# |seller|integer|null: false|
# |buyer|integer||
