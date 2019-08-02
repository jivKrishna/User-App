class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.search(params[:search])
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Time.now.strftime("%H%M%S")}.csv"}
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "An user is created successfully!"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User is updated successfully!"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "An user is deleted successfully!"
      redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :phone_number)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
