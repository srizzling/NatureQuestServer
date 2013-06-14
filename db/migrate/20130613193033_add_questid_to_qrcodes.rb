class AddQuestidToQrcodes < ActiveRecord::Migration
  def change
    add_column :qrcodes, :questid, :integer
  end
end
