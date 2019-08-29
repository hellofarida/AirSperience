class PagesController < ApplicationController
  def home
    @recent_experiences = Experience.last(3)
    @featured_categories = Category.featured(3)
  end


end
