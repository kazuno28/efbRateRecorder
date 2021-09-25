class RateGraphCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @rate_graph_comment = RateGraphComment.new(rate_graph_comment_params)
    @rate_graph_comment.user_id = current_user.id
    unless @rate_graph_comment.save!
      render 'error'
    end

  end

  def destroy
    @user = User.find(params[:user_id])
    rate_graph_comment = @user.rate_graph_comments.find(params[:id])
    rate_graph_comment.destroy
  end

  private

  def rate_graph_comment_params
    params.require(:rate_graph_comment).permit(:comment)
  end
end
