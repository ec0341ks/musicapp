class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to song_path(music_id), notice: 'コメントを投稿しました！'
    end
    binding.pry
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image, :music_id).merge(user_id: current_user.id)
  end
  def music_id
    musicid = Comment.find(comment_params[:music_id]).music_id
  end
end
