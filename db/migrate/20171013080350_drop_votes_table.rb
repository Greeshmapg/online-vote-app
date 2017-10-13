class DropVotesTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :votes
end
end
