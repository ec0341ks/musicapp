class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  require 'rspotify'
  RSpotify.authenticate(Rails.application.credentials[:spotify_client_id], Rails.application.credentials[:spotify_client_secret])
  require 'musix_match'
  MusixMatch::API::Base.api_key = Rails.application.credentials[:musixmatch_api_key]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
