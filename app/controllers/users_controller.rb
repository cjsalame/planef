# UsersController
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def current_user_show
    redirect_to current_user
  end
  def unsubschool
    @user = User.find(params[:id])
    schoolid = params[:schoolid]
    @user.schools.delete(School.find(schoolid))
    redirect_to @user
  end
  def subscribeschool
    @user = User.find(params[:id])
    schoolid = params[:schoolid]
    if true and schoolid != "Selecciona un colegio..." and !@user.schools.exists?(schoolid) # true = school secret code match
      @school = School.find(params[:schoolid])
      @user.schools << @school
    #else
      #@user.schools.delete(School.find(schoolid))
    end
    redirect_to @user
  end


end
