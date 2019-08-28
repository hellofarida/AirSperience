class ExperiencesController < ApplicationController
  def index
    if params[:title]
      @experiences = Experience.where('title LIKE ?', "%#{params[:title].capitalize}%")

    else
      @experiences = Experience.all
      # render 'experiences/not_found'
    end
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.owner = current_user
    if @experience.save
      redirect_to experiences_path
    else
      render :new
    end
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.owner = current_user
    if @experience.update(experience_params)
      redirect_to experience_path
    else
      render 'experiences/show'
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to dashboard_path
  rescue ActiveRecord::InvalidForeignKey
    redirect_to @experience, alert: "You can't delete a booked experience."
  end

  private

  def experience_params
    params.permit(:title, :description, :price, :photo)
  end
end
