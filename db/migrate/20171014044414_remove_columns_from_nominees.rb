class RemoveColumnsFromNominees < ActiveRecord::Migration[5.1]
  def change
     remove_column :nominees, :cached_weighted_score
     remove_column :nominees, :cached_weighted_total
     remove_column :nominees, :cached_weighted_average
  end
end
