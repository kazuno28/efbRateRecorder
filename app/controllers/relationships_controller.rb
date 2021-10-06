class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  #フォローする・外すボタンをクリックしたら元画面に遷移する
  def followings
    user = User.find(params[:user_id])
    @users = user.followings.page(params[:page]).reverse_order
    #一覧表に名前表示させるよう
    @user = User.find(params[:user_id])
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers.page(params[:page]).reverse_order
    #一覧表に名前表示させるよう
    @user = User.find(params[:user_id])
  end
end
