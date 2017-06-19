class SearchesController < ApplicationController

  def new
    @search = Search.new
    @subjects = Subject.all.uniq.pluck(:name)
    @schools = School.all.uniq.pluck(:name)
  end
  def create
    @search = Search.create(search_params)
    redirect_to @search
  end
  def show
    @search = Search.find(parmas[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :subject, :school, :grade)
  end
end
