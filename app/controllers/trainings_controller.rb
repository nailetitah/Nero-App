class TrainingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  def index
    @trainings = Training.all.order("start_date ASC")
  end

  def show 
    @training = Training.find(params[:id])
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      flash[:success] = "L'événément a été ajouté."
      redirect_to @training
    else
      render 'new'
    end 
  end

  def edit
  end

  def update
    session[:training_id] = @training.id
    flash[:success] = "Félicitations ! Vous êtes inscrit à la session n° #{session[:training_id]}." 
    redirect_to training_path(@training)
 end

  def destroy
    @training.destroy
    flash[:success] = "L'événément a été supprimé."
    redirect_to root_path
  end

  private

  def training_params
    params.require(:training).permit(:start_date, :duration, :title, :description, :price, :location, :training_planner_id)
  end

  def set_training
    @training = Training.find(params[:id])
  end

end


