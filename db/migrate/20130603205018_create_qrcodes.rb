class CreateQrcodes < ActiveRecord::Migration
  def change
    create_table :qrcodes do |t|
      t.string :name
      t.string :hash
      t.string :question
      t.string :SAnswer
      t.string :Answer2
      t.string :Answer3
      t.string :Answer4
      t.float :Long
      t.float :lat

      t.timestamps
    end
  end
end
