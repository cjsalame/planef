# SubjectsController
class SubjectsController < ApplicationController
  def create
    @school = School.find(params[:school_id])
    @subject = @school.subjects.build(subjects_params)
    @subject.save

    redirect_to @school
  end

  def destroy
    @school = School.find(params[:school_id])
    @subject = @school.subjects.find(params[:id]).destroy
    redirect_to @school
  end

  private

  def subjects_params
    params.require(:subject).permit(:name, :description)
  end
end
