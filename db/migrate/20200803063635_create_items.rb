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
      t.integer :buyer_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end