class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def invite
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    end
  end

  def history
    @votes = current_user.votes
  end

  def voting_page
    @category = Category.find(params[:cat_id])
    @nominees = @category.nominees
    @user = current_user
    @winners = Vote.winner(@category)
  end

  def new
    @user = User.new
  end

  def create
    @user
  end

  def invite_user
    @mail = params["user"]["email"]
    @user = User.find_by(email: @mail)
    if @user.present?
      UserNotifierMailer.invite_user(@mail).deliver
    else
      UserNotifierMailer.activate_user(@mail).deliver
    end
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
