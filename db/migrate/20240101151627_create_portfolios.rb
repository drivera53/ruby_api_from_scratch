class CreatePortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :description
      t.decimal :initial_balance
      t.decimal :current_balance
      t.integer :user_id

      t.timestamps
    end
  end
end
