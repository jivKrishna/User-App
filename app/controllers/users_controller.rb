class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def show
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html

      format.pdf { render pdf: "users", template: "users/user_pdf.html.erb", layout: "pdf.html.erb"}

      format.csv { send_data @users.to_csv, filename: "users-#{Time.now.strftime("%H%M%S")}.csv"}
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path(@user)
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :mobile_no)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
