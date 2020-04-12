class AdminsController < ApplicationController
  def index
    @admins = User.all # Admin.all
  end

  def select_action
  end
end
