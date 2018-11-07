class CreateIexes < ActiveRecord::Migration[5.2]
  def change
    create_table :iexes do |t|
      t.string :symbol
      t.string :name
      t.time :latestTime
      t.float :changePercent
      t.float :bidPrice
      t.float :askPrice

      t.timestamps
    end
  end
end
