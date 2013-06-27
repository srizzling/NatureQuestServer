# == Schema Information
#
# Table name: quests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  userid     :integer
#  cat        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quest < ActiveRecord::Base

  attr_accessible :cat, :name, :userid
 

end
