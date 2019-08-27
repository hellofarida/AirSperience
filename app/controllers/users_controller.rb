class UsersController < ApplicationController

  def dashboard
    user = current_user
    @experiences = Experience.all
    # @owner_experiences = @experiences.owner
  end

end
