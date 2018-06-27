class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone, :address ,:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :address ,:email, bank_attributes: [:bank_name, :bank_account]])
    end
end
