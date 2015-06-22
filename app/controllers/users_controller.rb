class UsersController < ApplicationController
  before_action :authority_check, only: [:index, :new, :edit, :create, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @groups = Group.all
  end

  def show
  end

  def edit
    @groups = Group.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: t('notice.users.create')
    else
      redirect_to @user.errors, status: :unprocessable_entity
    end
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :group_ids => [])
    end

    def authority_check
      unless current_user.administrator?
        redirect_to root_path, notice: t('notice.authority')
      end
    end
end
