class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  protect_from_forgery with: :exception

  ##before_filter :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
 
    rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: exception.message
   end

   def admin?
    role == 'admin'
  end
 
  protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end

   ##def authenticate_user!
    ##if user_signed_in?
     ## super
    ##else
     ## redirect_to root_path, :notice => 'Login is required.'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    ##end
  ##end
end
