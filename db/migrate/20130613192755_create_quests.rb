class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.integer :userid
      t.string :cat

      t.timestamps
    end
  end
end
