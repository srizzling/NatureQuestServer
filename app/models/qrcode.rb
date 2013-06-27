# == Schema Information
#
# Table name: qrcodes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  ref        :string(255)
#  question   :string(255)
#  SAnswer    :string(255)
#  Answer2    :string(255)
#  Answer3    :string(255)
#  Answer4    :string(255)
#  Long       :float
#  lat        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  imgloc     :string(255)
#  userid     :integer
#  questid    :integer
#  quest_id   :integer
#

class Qrcode < ActiveRecord::Base

  attr_accessible :Answer2, :Answer3, :Answer4, :Long, :SAnswer, :ref, :lat, :name, :question, :quest_id
  
  

   before_create :random_hash

  private
    def random_hash
    	self.ref=SecureRandom.hex(2);
    end
end
