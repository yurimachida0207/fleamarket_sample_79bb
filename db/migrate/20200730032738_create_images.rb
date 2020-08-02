class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :items_id            
      t.string :image
      
      t.timestamps
    end
  end
end
# |Column|Type|Options|
# |------|----|-------|
# |item_id|string|null: false, foreign_key: true|
# |image|string|null: false|

# ### Association

# - belongs_to :item