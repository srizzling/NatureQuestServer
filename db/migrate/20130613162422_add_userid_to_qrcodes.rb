class AddUseridToQrcodes < ActiveRecord::Migration
  def change
    add_column :qrcodes, :userid, :integer
  end
end
