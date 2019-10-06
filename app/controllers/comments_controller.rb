class CommentsController < ApplicationController
    
  def index
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image)
  end
    
end
