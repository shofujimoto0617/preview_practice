class PostImagesController < ApplicationController
  def new
  	@post_image = PostImage.new
  end

  def create
  	@post_image = PostImage.new(post_image_params)
  	@post_image.user_id = current_user.id
  	@post_image.save
  end

  def index
  	@post_images = PostImage.all
  end

  def show
  	@post_image = PostImage.find(params[:id])
  end

  def edit
  	@post_image = PostImage.find(params[:id])
  end

  def update
  	@post_image = PostImage.find(params[:id])
  	@post.update(post_image_params)
  end

  private

  def post_image_params
  	params.require(:post_image).permit(:title, :body, :post_image)
  end

end