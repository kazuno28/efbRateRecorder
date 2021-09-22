class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @rate_graph_comment = RateGraphComment.find(params[:rate_graph_comment_id])
    favorite = @rate_graph_comment.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @rate_graph_comment = RateGraphComment.find(params[:rate_graph_comment_id])
    favorite = @rate_graph_comment.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
