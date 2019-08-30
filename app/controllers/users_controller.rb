class UsersController < ApplicationController
  def dashboard
    @review = Review.new
    @experiences = current_user.experiences
    @bookings = current_user.bookings
    # @owner_experiences = @experiences.owner
  end
end
