class LecturesController < ApplicationController

  def create
    @planification = Planification.find(params[:planification_id])
    @lecture = @planification.lecture.create(lecture_params)
    redirect_to planification_path(@planification)
  end

  def destroy
  	@planification = Planification.find(params[:planification_id])
  	@lecture = @planification.lectures.find(params[:id])
  	@lecture.destroy
  	redirect_to edit_planification_path(@planification)
  end

  # TODO: edit
  # Not even necessary LUL. Borrar este comment.
 
  private

  def lecture_params
    params.require(:lecture).permit(:objectives, :starting, :developing,
    	:finalizing, :content, :resources, :duration, :evaluation)
  end

end
