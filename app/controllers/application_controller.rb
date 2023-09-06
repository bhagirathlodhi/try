class ApplicationController < ActionController::Base
  before_action :set_theme
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def moon
     cookies[:moon] = {
       value: 'dark mode on'
     }
     if @logged_in_user
       redirect_to root_path
     else
       redirect_to new_user_session_path
     end
   end

   def sun
     cookies.delete(:moon)
     if @logged_in_user
       redirect_to root_path
     else
       redirect_to new_user_session_path
     end
   end

  protected

  def set_theme
     if params[:theme].present?
       theme = params[:theme].to_sym
       # session[:theme] = theme
       cookies[:theme] = theme
       redirect_to(request.referrer || root_path)
     end
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
  end


end
