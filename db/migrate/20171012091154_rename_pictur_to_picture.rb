class RenamePicturToPicture < ActiveRecord::Migration[5.1]
  def change
     rename_column :nominees, :pictur, :picture
  end
end
