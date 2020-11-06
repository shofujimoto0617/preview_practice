class LikesController < ApplicationController
  def create
  	@post_image = PostImage.find(params[:post_image_id])
  	unless @post_image.liked_by?(current_user)
  	  like = current_user.likes.new(post_image_id: @post_image.id)
  	  like.save
  	end
  end

  def destroy
  	@post_image = PostImage.find(params[:post_image_id])
  	like = current_user.likes.find_by(post_image_id: @post_image.id)
  	like.destroy
  end
end
