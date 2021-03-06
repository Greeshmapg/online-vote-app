class Category < ApplicationRecord

  has_and_belongs_to_many :nominees

  validates :name, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :description, presence: true


 def active?
    if self.status == 'Active'
      return true
    else
      return false
    end
  end

  def check_category_liked?(user,category)
    @votes = Vote.all.where(category_id: category.id)
    if @votes.find_by(user_id: user.id).present?
        return true
      else
        return false
      end
  end

  def self.get_category_name(id)
    Category.find(id).name
  end

end
