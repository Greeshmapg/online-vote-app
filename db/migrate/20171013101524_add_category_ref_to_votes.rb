class AddCategoryRefToVotes < ActiveRecord::Migration[5.1]
   def change
    add_reference :votes, :category, foreign_key: true
  end
end
