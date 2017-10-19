class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_expiry
  protect_from_forgery with: :exception

  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  include Pundit


def check_expiry
    @categories = Category.all
    @categories.each do |category|
      if !category.end_date.future?
        category.update(status: 'Expired')
      end
    end
  end


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end


protected
def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :role_id])
end

def configure_account_update_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :role_id])
end


end
