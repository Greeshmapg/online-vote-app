class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :nominee
  belongs_to :category

  validates_uniqueness_of :nominee_id, scope: :user_id


  def self.winner(category)
    @votes=Vote.all.where(category_id: category.id)
    votes = 0
    @winners = []
    category.nominees.each do |nominee|
      temp =  @votes.all.where(nominee_id: nominee.id).count
      if temp >= votes
        votes = temp
      end
    end
    category.nominees.each do |nominee|
      if @votes.all.where(nominee_id: nominee.id).count == votes
        @winners << nominee
      end
    end
    return @winners
  end



end
