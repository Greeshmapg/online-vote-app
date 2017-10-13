class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :nominee


  def self.winner(category)
    @votes=Vote.all.where(category_id: category.id)
    votes = 0
    category.nominees.each do |nominee|
      temp =  @votes.all.where(nominee_id: nominee.id).count
      if temp >= votes
        winner = nominee
        votes = temp
      end
      return winner
    end
  end



end
