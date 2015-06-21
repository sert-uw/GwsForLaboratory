class HomeController < ApplicationController
  def index
    @base_group_name = current_user.group.present? ? current_user.group.name : ''
  end
end
