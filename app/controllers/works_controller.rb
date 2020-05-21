class WorksController < ApplicationController
  before_action :find_work, except: [:index, :new, :create]
  before_action :require_login, only: [:new, :create, :edit, :update]

  def index 
    @albums = Work.sort_media("album")
    @books = Work.sort_media("book")
    @movies = Work.sort_media("movie")
  end 

  def show 
    if @work.nil?
      redirect_to works_path
    end 
  end 

  def new
    @work = Work.new
  end 

  
  def create 
    @work = Work.new(work_params)
    if @work.save 
      redirect_to works_path
      return 
    else
      render :new
      return 
    end 
  end 

  def edit 
    if @work.nil?
      head :not_found
      return 
    end
  end 

  def update 
    if @work.nil? 
      head :not_found
      return 
    elsif @work.update(work_params)
      flash[:welcome] = "Successfully Updated"
      redirect_to work_path
      return 
    else
      render :edit 
      return 
    end 
  end 

  def destroy 
    if @work.nil? 
      redirect_to works_path 
      return 
    end 
    vote = Vote.find_by(work_id: @work.id)
    vote.destroy
    @work.destroy 
    redirect_to works_path 
    return 
  end 

  private 

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :year, :description)
  end 

  def find_work
    @work = Work.find_by(id: params[:id])
  end 

end
