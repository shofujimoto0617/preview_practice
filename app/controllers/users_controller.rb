class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@post_images = @user.post_images
  end

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  redirect_to user_path(current_user), notice: "ユーザー 「#{@user.name}」のデータを更新しました。"
  	end
  end

  def following
  	@user = User.find(params[:id])
  	@users = @user.following_user
  	render 'show_follow'
  end

  def followers
  	@user = User.find(params[:id])
  	@users = @user.follower_user
  	render 'show_follower'
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end
end
