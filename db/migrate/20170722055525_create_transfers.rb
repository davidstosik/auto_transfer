class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :recipient, null: false
      t.integer :amount, null: false
      t.string :message
      t.datetime :executed_at

      t.timestamps
    end
  end
end
