class AdminsController < ApplicationController
  before_action :authority_check

  def index
  end

  private

    def authority_check
      unless current_user.administrator?
        redirect_to root_path, notice: t('notice.authority')
      end
    end
end
