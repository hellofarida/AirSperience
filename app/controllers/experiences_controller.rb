class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.owner = current_user
    if @experience.save
      redirect_to root_path
    else

      render :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :description, :price, :photo)
  end
end
