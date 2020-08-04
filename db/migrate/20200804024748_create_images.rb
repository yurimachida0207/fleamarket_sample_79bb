class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string     :imege,    null: false
      t.references :item,     foregin_key: true
      t.timestamps
    end
  end
end
