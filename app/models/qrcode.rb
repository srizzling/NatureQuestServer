class Qrcode < ActiveRecord::Base
  attr_accessible :Answer2, :Answer3, :Answer4, :Long, :SAnswer, :ref, :lat, :name, :question


   before_create :random_hash

  private
    def random_hash
    	self.ref=SecureRandom.hex(2);
    end
end
