class Nominee < ApplicationRecord

  has_and_belongs_to_many :categories
  has_many :votes
  has_many :users, through: :votes
  mount_uploader :picture, ::PictureUploader

  validates :name, presence: true
  validates :picture, presence: true
  validates :description, presence: true

   def vote_count(category)
    @votes=Vote.all.where(category_id: category.id)
    @votes.all.where(nominee_id: self.id).count
  end

  def self.get_nominee_name(id)
    self.find(id).name
  end


end
