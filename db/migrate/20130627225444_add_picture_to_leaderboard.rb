class AddPictureToLeaderboard < ActiveRecord::Migration
  def change
    add_column :leaderboards, :picture, :string
  end
end
