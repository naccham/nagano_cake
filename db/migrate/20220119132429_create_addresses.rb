class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :address_id
      t.integer :customer_id
      t.string :name #宛名
      t.string :postal_code #郵便番号
      t.string :address #住所
      t.timestamps
    end
  end
end
