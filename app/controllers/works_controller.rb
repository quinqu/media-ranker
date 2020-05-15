class WorksController < ApplicationController

  def index 
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")
  end 

  def show 
    @work = Work.find_by(id: params[:id])

  end 

  def new
    @work = Work.new
  end 

  
  def create 
    @work = Work.new(work_params)
    if @work.save 
      redirect_to root_path
      #redirect_to work_path(@passenger.id)
    else
      render :new
      return 
    end 
  end 

  private 

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :year, :description)
 
  end 

  
end
