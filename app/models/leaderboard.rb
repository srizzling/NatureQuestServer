class Leaderboard < ActiveRecord::Base
  attr_accessible :score, :user_id
end
