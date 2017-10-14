class RemoveColumnsFromNominee < ActiveRecord::Migration[5.1]
  def change
    remove_column :nominees, :votes
  end
end
