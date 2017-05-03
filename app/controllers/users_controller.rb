# UsersController
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def current_user_show
    redirect_to current_user
  end
end
