class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: t('notice.users.delete')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
