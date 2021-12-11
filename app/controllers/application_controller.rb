class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_admin
    if signed_in? == false
      flash[:alert] = "Please sign in to continue"
      if request.referrer == nil
        redirect_to root_path
      else
        redirect_to request.referrer
      end
    end
    if signed_in? == true
      if current_user.admin != true
        flash[:alert] = "You are not authorized to perform this action"
        if request.referrer == nil
          redirect_to root_path
        else
          redirect_to request.referrer
        end
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
