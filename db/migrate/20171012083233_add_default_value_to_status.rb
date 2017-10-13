class AddDefaultValueToStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :categories, :status, :string, default: 'Active'
  end
end
