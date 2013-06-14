class AddQuestIdToQrcodes < ActiveRecord::Migration
  def change
    add_column :qrcodes, :quest_id, :integer
  end
end
