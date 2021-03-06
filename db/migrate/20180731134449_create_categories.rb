class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      # 根据字段大小的展示产品的优先
      t.integer :weight, default: 0
      t.integer :products_counter, default: 0
      t.timestamps
    end

    add_index :categories, [:title]
  end
end
