class SongsController < ApplicationController
  def index
  end
  def search
    artists = Song.artists_search(input_params)
    @topartists = artists.take(5)
    @song = Song.music_search_by_id(params[:id])
  end
  def show
    @song = Song.music_search_by_id(params[:id])
    # 曲のidが一致したコメントを表示する
    @comments = Comment.where(music_id: @song.id)
  end
  private
  def input_params
    params[:name_cont].to_s
  end
end