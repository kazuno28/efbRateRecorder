class RateGraphCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @rate_graph_comment = RateGraphComment.new(rate_graph_comment_params)
    @rate_graph_comment.user_id = current_user.id
    @rate_graph_comment.other_user_id = @user.id
    @rate_graph_comments = RateGraphComment.where(other_user_id: @user.id).order('updated_at DESC').page(params[:page]).per(5)
    unless @rate_graph_comment.save
      render 'error'
    end

  end

  def destroy
    @user = User.find(params[:user_id])
    rate_graph_comment = RateGraphComment.find(params[:id])
    rate_graph_comment.destroy
    @rate_graph_comments = RateGraphComment.where(other_user_id: @user.id).order('updated_at DESC').page(params[:page]).per(5)
  end

  private

  def rate_graph_comment_params
    params.require(:rate_graph_comment).permit(:comment)
  end
end
