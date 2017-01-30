class CreateShipitPullRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :pull_requests do |t|
      t.references :stack, foreign_key: true, null: false
      t.integer :number, null: false
      t.string :title, limit: 256
      t.integer :github_id, limit: 8
      t.string :api_url, limit: 1024
      t.string :state
      t.references :head, foreign_key: true
      t.boolean :mergeable, null: true
      t.integer :additions, null: false, default: 0
      t.integer :deletions, null: false, default: 0
      t.string :merge_status, null: false
      t.datetime :merge_requested_at, null: false
      t.timestamps

      t.index [:stack_id, :number], unique: true
      t.index [:stack_id, :github_id], unique: true
      t.index [:stack_id, :merge_status]
    end
  end
end
