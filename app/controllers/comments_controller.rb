class CommentsController < ApplicationController
    
  def index
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image, :music_id).merge(user_id: current_user.id)
  end
end
