class CreateRuns < ActiveRecord::Migration
  def self.up
    create_table :runs do |t|
      t.integer :user_id
      t.date :date
      t.float :distance
      t.time :time

      t.timestamps
    end
  end

  def self.down
    drop_table :runs
  end
end
