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
#

require 'test_helper'

class QrcodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
