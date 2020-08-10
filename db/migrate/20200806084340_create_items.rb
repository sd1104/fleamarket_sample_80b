class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :brand
      t.string :condition_id, null: false
      t.string :delivery_charge_id, null: false
      t.string :delivery_origin_id, null: false
      t.string :delivery_date_id, null: false
      t.bigint :category_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.bigint :seller_id, null: false, foreign_key: true
      t.bigint :buyer_id, foreign_key: true
      t.timestamps
    end
  end
end
