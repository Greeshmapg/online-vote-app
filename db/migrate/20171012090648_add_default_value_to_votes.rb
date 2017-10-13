class AddDefaultValueToVotes < ActiveRecord::Migration[5.1]
  def change
     change_column :nominees, :votes, :integer, default: 0
  end
end
