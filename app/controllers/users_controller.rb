class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @categories = Category.all
  end

  def invite
    @user = User.new
  end

  def voting_page
    @category = Category.find(params[:cat_id])
    @nominees = @category.nominees
    @user = current_user
    @winner = Vote.winner(@category)
  end

  def new
    @user = User.new
  end

  def create
    @user
  end

  def invite_user
   @mail = params["user"]["email"]
   UserNotifierMailer.invite_user(@mail).deliver
  end


  private
  def user_params
    params.require(:user).permit(:email)
  end
  def sign_up_params
    params.require(:user).permit(:first_name, :email, :password,
                            :password_confirmation,:last_name,:phone_number)
  end

end
