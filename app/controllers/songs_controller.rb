class SongsController < ApplicationController
  def index
  end
  def search
    artists = RSpotify::Artist.search(input_params)
    @topartists = artists.take(3)
    # binding.pry
  end
  def show
    @artist = RSpotify::Artist.search(params[:id].to_s).first
    # binding.pry
  end
  private
  def input_params
    params[:name_cont].to_s
  end
end