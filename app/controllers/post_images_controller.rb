class PostImagesController < ApplicationController
  def new
  	@post_image = PostImage.new
  end

  def create
  	@post_image = PostImage.new(post_image_params)
  	@post_image.user_id = current_user.id
  	@post_image.save
  	redirect_to @post_image, notice: "title 「#{@post_image.title}」を保存しました。"
  end

  def index
  	@post_images = PostImage.all.page(params[:page]).per(5)
  end

  def show
  	@post_image = PostImage.find(params[:id])
  end

  def edit
  	@post_image = PostImage.find(params[:id])
  end

  def update
  	@post_image = PostImage.find(params[:id])
  	@post_image.update(post_image_params)
  	redirect_to post_images_path, notice: "title 「#{@post_image.title}」を更新しました。"
  end

  def destroy
  	@post_image = PostImage.find(params[:id])
  	@post_image.destroy
  	redirect_to post_images_url, notice: "title 「#{@post_image.title}」を削除しました。"
  end

  private

  def post_image_params
  	params.require(:post_image).permit(:title, :body, :image)
  end

end
