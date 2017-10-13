class AddNomineeRefToVotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :nominee, foreign_key: true
  end
end
