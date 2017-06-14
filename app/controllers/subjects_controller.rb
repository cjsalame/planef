# SubjectsController
class SubjectsController < ApplicationController
  def create
    @school = School.find(params[:school_id])
    @subject = @school.subjects.build(subjects_params)
    @subject.save

    redirect_to @school
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html do
        redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def subjects_params
    params.require(:subject).permit(:name, :description)
  end
end
