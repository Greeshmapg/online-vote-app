class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_expiry
  protect_from_forgery with: :exception

before_action :configure_sign_up_params, if: :devise_controller?


def check_expiry
    @categories = Category.all
    @categories.each do |category|
      if !category.end_date.future?
        category.update(status: 'Expired')
      end
    end
  end


protected
def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :role_id])
end

end
