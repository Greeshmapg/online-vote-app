class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @categories = Category.all.order(created_at: :desc)
    @categories_all = Category.all.order(created_at: :desc).page params[:page]
  end

  def invite
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(account_update_params)
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

  def invite_user
    @mail = params["user"]["email"]
    @user = User.find_by(email: @mail)
    respond_to do |format|
      if @user.present?
        UserNotifierMailer.invite_user(@mail).deliver
        flash.now[:alert] = 'Mail sent successfully!!!'
        format.js
      else
        UserNotifierMailer.activate_user(@mail).deliver
        flash.now[:alert] = 'Mail sent successfully!!!'
        format.js
      end
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
  def account_update_params
    params.require(:user).permit(:first_name, :email, :password,
                            :password_confirmation,:last_name,:phone_number)
  end

end
