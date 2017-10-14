class AddDescriptionToNomineess < ActiveRecord::Migration[5.1]
  def change
    add_column :nominees, :description, :text
  end
end
