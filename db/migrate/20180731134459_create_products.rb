class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :title
      # 商品状态,上架或者下架
      t.string :status, default: 'off'
      # 库存
      t.integer :amount, default: 0
      # 追踪商品
      t.string :uuid
      # 折扣价
      t.decimal :msrp, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2
      t.text :description
      t.timestamps
    end

    add_index :products, [:status, :category_id]
    add_index :products, [:category_id]
    add_index :products, [:uuid], unique: true
    add_index :products, [:title]
  end
end
