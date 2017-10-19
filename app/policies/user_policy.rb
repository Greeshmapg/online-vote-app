class UserPolicy < ApplicationPolicy

  def edit?
    if user == record
      return true
    else
      return false
    end
  end

end
