class CreateProductAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :product_addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.integer :postal_code, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :building_name
      t.string :phone_number, unique: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
