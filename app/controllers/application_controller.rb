class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_ability

  helper_method :current_user
  
  protected

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   puts "Current User Role: #{@current_user&.role}"
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email role])
  end

  def load_ability
    @ability = Ability.new(current_user) if current_user
  end

  def user_signed_in?
    current_user.present?
  end
  
  helper_method :user_signed_in?

  # def authenticate_user!
  #     redirect_to new_user_session_path, notice: "Please sign in" unless user_signed_in?
  # end

end
