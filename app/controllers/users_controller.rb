class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
  end

  def show
  end

  def edit
    @groups = Group.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('notice.users.update')
    else
      redirect_to @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: t('notice.users.delete')
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :group_ids => [])
    end
end
