class SongsController < ApplicationController
  def index
    artists = RSpotify::Artist.search('maroon')
    binding.pry
  end
end