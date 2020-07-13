class StaticPagesController < ApplicationController
  def home
  	@prisoner = Prisoner.new
  	@volunteer = Volunteer.new
    @prisoners = Prisoner.all
  end

  def courses
    @courses = Course.active.order('title ASC')
  end
end
