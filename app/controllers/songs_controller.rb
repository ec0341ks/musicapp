class SongsController < ApplicationController
  def index
    @response = MusixMatch.search_track(:q_artist => 'ariana')
  end
end