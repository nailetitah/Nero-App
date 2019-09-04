class TrainingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    if @training.save
    @user = current_user
    @user.update(training_id: @training.id)
    flash[:success] = "Vous êtes inscrits au training n° #{@training.id}"
    redirect_to trainings_path
  end
 end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    flash[:success] = "L'événément a été supprimé."
    redirect_to root_path
  end

  private

  def training_params
    params.require(:training).permit(:start_date, :duration, :title, :description, :price, :location, :training_planner_id)
  end

  def find_training
    @training = Training.find(params[:id])
  end

end


