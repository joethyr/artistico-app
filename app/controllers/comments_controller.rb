class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = @picture.comments.create(comment_params)
    @comment.save!

    redirect_to picture_path(@picture)
  end

  def destroy
    @comment = @picture.comments.find(params[:id])
    @comment.destroy

    rediert_to picture_path(@picture)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:name, :reply)
  end
end
