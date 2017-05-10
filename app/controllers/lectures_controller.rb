class LecturesController < ApplicationController

  def create
    @planification = Planification.find(params[:planification_id])
    @lecture = @planification.lecture.create(lecture_params)
    redirect_to planification_path(@planification)
  end
 
  private

  def lecture_params
    params.require(:lecture).permit(:objectives, :starting, :developing,
    	:finalizing, :content, :resources, :duration, :evaluation)
  end
  
end
