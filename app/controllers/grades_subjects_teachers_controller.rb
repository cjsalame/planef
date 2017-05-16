class GradesSubjectsTeachersController < ApplicationController
  def show
    @grades_subjects_teacher = GradesSubjectsTeacher.find(params[:id])
    @grade = @grades_subjects_teacher.grade
    @user = @grades_subjects_teacher.subjects_teacher.user
    @subject = @grades_subjects_teacher.subjects_teacher.subject
  end

  def new
    @grades_subjects_teacher = GradesSubjectsTeacher.new
  end

  def edit; end

  def create
    @user = current_user
    @grades_subjects_teacher = GradesSubjectsTeacher.new(grades_subjects_teacher_params)
    respond_to do |format|
      if @grades_subjects_teacher.save
        format.html do
          redirect_to @user, notice: 'Curso agregado con éxito.'
        end
        format.json do
          render :show, status: :created, location: @grades_subjects_teacher
        end
      else
        format.html { render :new }
        format.json do
          render json: @grades_subjects_teacher.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def grades_subjects_teacher_params
    params.require(:grades_subjects_teacher).permit(:grade_id, :subjects_teacher_id)
  end
end
