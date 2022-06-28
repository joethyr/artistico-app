class AddUserPictureToPictures < ActiveRecord::Migration[7.0]
  def change
    add_column :pictures, :user_picture, :string
  end
end
