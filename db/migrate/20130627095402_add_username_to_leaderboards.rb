class AddUsernameToLeaderboards < ActiveRecord::Migration
  def change
    add_column :leaderboards, :username, :string
  end
end
