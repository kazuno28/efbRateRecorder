class RateGraphsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @rate_graphs = RateGraph.page(params[:page]).reverse_order
  end

  def create
    @rate_graph = RateGraph.new(rate_graph_params)
    @rate_graph.user_id = current_user.id
    if @rate_graph.save
      redirect_to user_path(current_user), notice: "正常に入力されました。"
    else
      @rate_graphs = RateGraph.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @rate_graph.update(rate_graph_params)
      redirect_to user_path(current_user), notice: "変更が更新されました。"
    else
      render "edit"
    end
  end

  private

  def rate_graph_params
    params.require(:rate_graph).permit(:before_rate, :after_rate)
  end

  def ensure_correct_user
    @rate_graph = RateGraph.find(params[:id])
    unless @rate_graph.user == current_user
      redirect_to user_path(current_user)
    end
  end

end
