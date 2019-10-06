class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'rspotify'
  RSpotify.authenticate(Rails.application.credentials[:spotify_client_id], Rails.application.credentials[:spotify_client_secret])

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
