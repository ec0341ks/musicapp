class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  require 'rspotify'
  RSpotify.authenticate(Rails.application.credentials[:spotify_client_id], Rails.application.credentials[:spotify_client_secret])


  # require 'musix_match'
  # MusixMatch::API::Base.api_key = Rails.application.credentials.musixmatch_secret_key

  # require 'rspotify/oauth':
  # Rails.application.config.middleware.use OmniAuth::Builder do
  #   provider :spotify, spotify_client_id, spotify_client_secret, scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
  # end
end
