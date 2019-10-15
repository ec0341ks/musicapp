class SongsController < ApplicationController
  def index
  end
  def search
    artists = Song.artists_search(input_params)
    @topartists = artists.take(3)
  end
  def show
    @artist = Song.artists_search(params[:id].to_s).first
    # 曲のidが一致したコメントを表示する
    @comments = Comment.where(music_id: @artist.top_tracks(:US)[0].id)
  end
  private
  def input_params
    params[:name_cont].to_s
  end
end