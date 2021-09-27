class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @rate_graph_comment = RateGraphComment.find(params[:rate_graph_comment_id])
    favorite = @rate_graph_comment.favorite.new(user_id: current_user.id)
    @user = User.find(params[:user_id])
    favorite.save
  end

  def destroy
    @rate_graph_comment = RateGraphComment.find(params[:rate_graph_comment_id])
    favorite = @rate_graph_comment.favorite.find_by(user_id: current_user.id)
     @user = User.find(params[:user_id])
    favorite.destroy
  end
end
