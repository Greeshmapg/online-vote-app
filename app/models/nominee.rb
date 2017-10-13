class Nominee < ApplicationRecord

  has_and_belongs_to_many :categories
  has_many :vote
  mount_uploader :picture, ::PictureUploader

def check_liked?(user,category)
    @votes = Vote.all.where(category_id: category.id)
    if @votes.find_by(user_id: user.id).present?
        return true
      else
        return false
      end
  end

   def vote_count(category)
    @votes=Vote.all.where(category_id: category.id)
    @votes.all.where(nominee_id: self.id).count
  end


end
