class User < ApplicationRecord

  belongs_to :role
  has_many :votes
  has_many :nominees, through: :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


def check_liked?(user,category)
    @votes = Vote.all.where(category_id: category.id)
    if @votes.find_by(user_id: user.id).present?
        return true
      else
        return false
      end
  end

  def admin?
    if self.role_id == 1
      return true
    else
      return false
    end
  end

  def full_name
    [first_name,last_name].join(" ")
  end





end
