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
      redirect_to @image, notice: "An image is created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to @image, notice: "Image is updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    if @image.destroy
      redirect_to images_path, notice: "An image is deleted successfully!"
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
