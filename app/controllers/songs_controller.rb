class SongsController < ApplicationController
  def index
    artists = RSpotify::Artist.search('a')
    @topartists = artists.take(3)
    # binding.pry
  end
end