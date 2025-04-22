class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @prototype = Prototype.find(@comment.prototype_id)
    if @comment.save
      redirect_to prototype_path(@prototype), notice: 'プロトタイプが作成されました。'
    else
      @comments = @prototype.comments.includes(:user)
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end