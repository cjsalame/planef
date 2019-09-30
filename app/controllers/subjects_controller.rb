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

  def show
    @school = School.find(params[:school_id])
    @subject = Subject.find(params[:id])
    # @planification = Planification.find_by(school: @school, subject: @subject)
    @plans_schools_subjects = []
    Planification.all.each do |p|
      @plans_schools_subjects << p if p.school == @school.name && p.subject == @subject.name
    end
  end

  private

  def subjects_params
    params.require(:subject).permit(:name, :description)
  end
end
