class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_id #注文ID
      t.integer :customer_id #会員ID
      t.string :postal_code #配送先郵便番号
      t.string :address #配送先住所
      t.string :name #配送先宛名
      t.integer :shopping_cost #送料
      t.integer :total_payment #請求額
      t.integer :payment_method #支払方法
      t.integer :status #注文ステータス
      t.timestamps 
    end
  end
end
