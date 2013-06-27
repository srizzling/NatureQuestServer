class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.integer :user_id
      t.integer :score
      t.timestamps
    end
  end
end
