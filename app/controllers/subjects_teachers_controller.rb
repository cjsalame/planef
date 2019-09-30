# SubjectsTeachersController
class SubjectsTeachersController < ApplicationController
  def show; end

  def new
    @subjects_teacher = SubjectsTeacher.new
  end

  def edit; end

  def create
    @user = current_user
    @subjects_teacher = @user.subjects_teachers.build(subjects_teacher_params)
    respond_to do |format|
      if @subjects_teacher.save
        format.html do
          redirect_to users_schools_path(@user), notice: 'Asignatura agregada con éxito.'
        end
        format.json do
          render :show, status: :created, location: @subjects_teacher
        end
      else
        format.html do
          redirect_to users_schools_path(@user), notice: 'Asignatura inválida.'
        end
        format.json do
          render json: @subjects_teacher.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def subjects_teacher_params
    params.require(:subjects_teacher).permit(:subject_id)
  end
end
