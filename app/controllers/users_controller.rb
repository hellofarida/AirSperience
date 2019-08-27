class UsersController < ApplicationController
  def dashboard
    @experiences = current_user.experiences
    @bookings = current_user.bookings
    # @owner_experiences = @experiences.owner
  end


  def dashboard
    user = current_user
    @experiences = Experience.all
    # @owner_experiences = @experiences.owner
  end

end
