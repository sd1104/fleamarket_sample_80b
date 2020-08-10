class ApplicationController < ActionController::Base
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    end
  
    # before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :basic_auth, if: :production?
  
    # def after_sign_in_path_for(resource)
    #   path
    # end
  
    # protected
    # def configure_permitred_parameters
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    # end
  
    # private
  
    # def production?
    #   Rails.env.production?
    # end
  
    # def basic_auth
    #   authenticate_or_request_with_http_basic do |username, password|
    #     username == Rails.application.credentials[:basic_auth][:user] &&
    #     password == Rails.application.credentials[:basic_auth][:pass]
    #   end
    # end
  end
end