class User < ApplicationRecord

  belongs_to :role
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




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
