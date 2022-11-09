class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_ability

  protected

  def current_ability
    if superuser_signed_in?
      @current_ability ||= Ability.new(current_superuser)
    elsif doctor_signed_in?
      @current_ability ||= Ability.new(current_doctor)
    elsif user_signed_in?
      @current_ability ||= Ability.new(current_user)
    end
  end

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone_number login email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone_number login])
  end
end
