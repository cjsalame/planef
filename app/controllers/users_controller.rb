# UsersController
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @subjects_teacher = @user.subjects_teachers.new
  end

  def current_user_show
    redirect_to current_user
  end
  def unsubschool
    @user = User.find(params[:id])
    schoolid = params[:schoolid]
    @user.schools.delete(School.find(schoolid))
    redirect_to @user, notice: 'Colegio eliminado.'
  end
  def subscribe_school
    @user = User.find(params[:id])
    schoolid = params[:schoolid]
    if schoolid == "Selecciona un colegio..."
      redirect_to @user, notice: 'Seleccione una opción válida.'
    elsif @user.schools.exists?(schoolid)
      redirect_to @user, notice: 'Usted ya está inscrito en este colegio.'
    elsif true # true = school secret code match
      @school = School.find(params[:schoolid])
      @user.schools << @school
      redirect_to @user, notice: 'Nuevo colegio agregado con éxito.'
    #else
      #@user.schools.delete(School.find(schoolid))
    end
  end

  # def subscribe_subject
  #  @user = User.find(params[:id])
  #  subjectid = params[:subjectid]
  #  if @user.subjects.exists?(subjectid)
  #    redirect_to @user, notice: 'Usted ya agregó este curso en este colegio'
  #  else
  #    Subjects_User.create(subject_id: subjectid, user_id: @user.id)
  #  end
  # end

end
