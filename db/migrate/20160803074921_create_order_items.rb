class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :show
      t.references :order
      t.integer  :quantity
      t.decimal  :ad_price
    end
  end
end
