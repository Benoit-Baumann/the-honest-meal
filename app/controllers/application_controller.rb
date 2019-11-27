class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :error

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone_number, :photo]) #Inclure status? Peut-on changer le type de compte une fois créé?
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
