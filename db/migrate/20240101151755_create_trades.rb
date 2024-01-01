class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.string :coin_name
      t.string :coin_id
      t.decimal :price
      t.integer :quantity
      t.integer :user_id
      t.integer :portfolio_id
      t.string :image

      t.timestamps
    end
  end
end
