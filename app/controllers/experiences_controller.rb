class ExperiencesController < ApplicationController
  def index
    if params[:title]
      @experiences = Experience.where('title ILIKE ?', "%#{params[:title]}%")
      empty_search_message = "Sorry #{params[:title].capitalize} could not found, have a look at what else is on offer"
    else
      @experiences = Experience.all
    end
    redirect_to experiences_path, flash: { empty_search: empty_search_message } if @experiences.empty?
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
  end

  def new
    @experience = Experience.new
  end

  def create
    @review = Review.new
    @experience = Experience.new(experience_params)
    @experience.owner = current_user
    @experience.categories = Category.where(id: category_ids)
    if @experience.save
      redirect_to dashboard_path
    else
      render :index
    end
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.owner = current_user
    @experience.categories = Category.where(id: category_ids)
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

  def category_ids
    params[:experience][:category_ids]
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :price, :photo)
  end
end
