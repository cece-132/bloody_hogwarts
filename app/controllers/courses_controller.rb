class CoursesController < ApplicationController

  def index
    @courses = Course.order(:name)
  end
  
end