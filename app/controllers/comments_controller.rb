class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    set_user_picture
    @comment = @picture.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save!

    respond_to do |format|
      format.html { redirect_to picture_path(@picture), notice: "Comment was successfully created." }
      format.json { head :no_content }
    end
  end

  def destroy
    set_user_picture
    @comment = @picture.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to picture_path(@picture), alert: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
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
