class ApplicationController < ActionController::Base

  before_action :basic_auth
  before_action :authenticate_with_http_digest
  before_action :configure_permitted_parameters, if: :devise_controller?

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password])
  end

end
