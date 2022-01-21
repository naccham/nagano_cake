class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_detail_id #注文商品
      t.integer :item_id #商品id
      t.integer :order_id #注文id
      t.integer :price #購入時価格(税込)
      t.integer :amount #数量
      t.integer :making_status #製作ステータス
      t.timestamps
    end
  end
end
