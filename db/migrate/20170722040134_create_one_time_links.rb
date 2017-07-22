class CreateOneTimeLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :one_time_links do |t|
      t.string :path, null: false
      t.string :token, null: false, index: { unique: true }
      t.datetime :used_at

      t.timestamps

      t.index %i(path token)
    end
  end
end
