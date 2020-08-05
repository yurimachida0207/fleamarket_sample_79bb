class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :item_name,  null:false
      t.integer     :price,      null:false
      t.integer     :seller_id,  null:false
      t.integer     :buyer_id
      t.timestamps
    end
  end
end
