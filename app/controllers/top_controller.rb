class TopController < ApplicationController
  def index
  end
  def search
    artists_uri = RSpotify::Artist.search(input_params).first.uri
  end
  def input_params
    params.permit(:input)
  end
end
