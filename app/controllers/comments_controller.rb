class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @comment = Comment.create(comment_params)
      if @comment.save
        redirect_to song_path(@comment.music_id)
      end
    else
      redirect_to new_user_session_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :image, :music_id).merge(user_id: current_user.id)
  end
end
