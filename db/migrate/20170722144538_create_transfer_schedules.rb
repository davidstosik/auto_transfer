class CreateTransferSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :transfer_schedules do |t|
      t.string :recipient
      t.integer :amount
      t.string :message
      t.text :schedule

      t.timestamps
    end
  end
end
