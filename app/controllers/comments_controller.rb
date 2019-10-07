class CommentsController < ApplicationController
  def show
    @comment = Comment.new
    @artist = RSpotify::Artist.search(params[:id].to_s).first
  end

  def create
    @comment = Comment.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image)
  end
    
end
