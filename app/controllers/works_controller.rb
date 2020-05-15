class WorksController < ApplicationController

  def index 
    @work = Work.all
  end 

  def show 
    @work = Work.find_by(id: params[:id])
  end 

  def new
    @work = Work.new
  end 

  
  def create 

  end 


  
end
