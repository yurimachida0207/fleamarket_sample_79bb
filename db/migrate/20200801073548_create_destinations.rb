class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :user,             null: false, foreign_key: true
      t.string :ship_last_name,       null: false
      t.string :ship_first_name,      null: false
      t.string :ship_last_name_kana,  null: false
      t.string :ship_first_name_kana, null: false
      t.integer :phone_number,        null: false, unique: true
      t.integer :zip_code,            null: false
      t.string :prefecture,           null: false
      t.string :city,                 null: false
      t.string :address,              null:false
      t.string :second_address,       null:false
      t.timestamps
    end
  end
end
