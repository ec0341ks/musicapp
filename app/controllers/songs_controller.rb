class SongsController < ApplicationController
  require 'musix_match'
  MusixMatch::API::Base.api_key = Rails.application.credentials.musixmatch_secret_key

end