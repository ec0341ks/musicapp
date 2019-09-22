class SongsController < ApplicationController
  def index
    artists = RSpotify::Artist.search('Ariana')
    @topartists = artists.take(3)
    # binding.pry
  end
end