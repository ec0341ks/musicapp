class SongsController < ApplicationController
  def index
  end
  def search
    artists = RSpotify::Artist.search(input_params)
    @topartists = artists.take(3)
    # binding.pry
    @keyword = input_params[:name_cont]
  end
  def show

  end


  
  def input_params
    params[:name_cont].to_s
  end
end