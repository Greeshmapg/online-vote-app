class AddPictureToNominees < ActiveRecord::Migration[5.1]
  def change
    add_column :nominees, :pictur, :string
  end
end
