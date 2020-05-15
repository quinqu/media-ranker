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
      #redirect_to work_path(@work.id)
    else
      render :new
      return 
    end 
  end 

  def edit 
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return 
    end

  end 


  def update 
    @work = Work.find_by(id: params[:id])
    if @work.nil? 
      head :not_found
      return 
    elsif @work.update(work_params)
      redirect_to work_path
      return 
    else
      render :edit 
      return 
    end 


  end 

  def destroy 
    @work = Work.find_by(id: params[:id])
    if @work.nil? 
      redirect_to works_path 
      return 
    end 

    @work.destroy 
    redirect_to works_path 
    return 
  end 

  private 

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :year, :description)
  end 

  
end
