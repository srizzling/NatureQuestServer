class AddImglocToQrcodes < ActiveRecord::Migration
  def change
    add_column :qrcodes, :imgloc, :string
  end
end
