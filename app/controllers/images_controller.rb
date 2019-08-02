class ImagesController < ApplicationController
  before_action :find_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all.order("created_at DESC")
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)

    if @image.save
      flash[:success] = "Image is uploaded successfully!"
      redirect_to @image
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      flash[:success] = "Image is updated successfully!"
      redirect_to @image
    else
      render :edit
    end
  end

  def destroy
    if @image.destroy
      flash[:success] = "An image is deleted successfully!"
      redirect_to images_path
    end
  end

  private
    def image_params
      params.require(:image).permit(:title, :img, :description)
    end

    def find_image
      @image = Image.find(params[:id])
    end
end
