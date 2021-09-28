class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @rate_graphs = @user.rate_graphs.map.with_index{|rg, idx| [idx+1, rg.after_rate]}
    @rate_graph = RateGraph.new
    @rate_graph_comment = RateGraphComment.new
    @rate_graph_comment.user = @user
    @rate_graph_comments = RateGraphComment.where(other_user_id: @user.id).order('updated_at DESC').page(params[:page]).per(5)
    @page = params[:page]

  end

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
    @rate_graph_comments = RateGraphComment.where(other_user_id: @user.id).order('updated_at DESC').page(params[:page]).per(5)
    rate_graph_comment = RateGraphComment.where(other_user_id: @user.id).find(params[:id])
    rate_graph_comment.destroy
   end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "変更が更新されました。"
    else
      render :edit
    end
  end

  private


  def rate_graph_comment_params
    params.require(:rate_graph_comment).permit(:comment)
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
