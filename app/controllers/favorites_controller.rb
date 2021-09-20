class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @rate_graph_comment = RateGraphComment.find(params[:id])
    favorite = @rate_graph_comment.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @rate_graph_comment = RateGraphComment.find(params[:id])
    favorite = @rate_graph_comment.favorites.new(user_id: current_user.id)
    favorite.destroy
  end
end
