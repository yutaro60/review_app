class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to review_path(params[:review_id])  }
      format.json
    end
  end

  private
 def comment_params
    params.require(:comment).permit(:text, :rate).merge(user_id: current_user.id, review_id: params[:review_id])
 end
end
