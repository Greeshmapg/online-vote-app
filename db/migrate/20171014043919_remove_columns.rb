class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :nominees, :cached_votes_total
    remove_column :nominees, :cached_votes_score
    remove_column :nominees, :cached_votes_up
    remove_column :nominees, :cached_votes_down

  end
end
