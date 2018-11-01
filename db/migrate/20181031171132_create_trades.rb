class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :user_id
      t.integer :asset_id
      t.string :symbol
      t.boolean :buy
      t.float :price
      t.float :quantity

      t.timestamps
    end
  end
end
