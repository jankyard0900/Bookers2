class RelationshipsController < ApplicationController
  #フォローするとき
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  # フォロー外すとき
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  # 自分がフォローしている人一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  # 自分のフォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
