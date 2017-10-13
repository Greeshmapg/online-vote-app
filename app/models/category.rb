class Category < ApplicationRecord

  has_and_belongs_to_many :nominees
  validates :name, presence:true
  validates :end_date, presence:true



 def active?
    if self.status == 'Active'
      return true
    else
      return false
    end
  end

end
