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
    @comments = Comment.all
    # binding.pry
    # @artist.top_tracks(:US)[0].id  きょくのid
  end
  private
  def input_params
    params[:name_cont].to_s
  end
end