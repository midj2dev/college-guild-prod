class CoursesController < ApplicationController
  def index
    @courses = Course.active
  end

  def new
    @course = Course.new
  end

  def create
    sub_courses = []
    (params["course"].length - 1).times do |n|
      sub_courses.push(params["course"]["sub_course_#{n}"])
    end
    @course = Course.new(title: params["course"][:title], sub_courses: sub_courses)
    if @course.save
      redirect_to '/course_overview'
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    sub_courses = []
    (params["course"].length - 1).times do |n|
      sub_courses.push(params["course"]["sub_course_#{n}"])
    end
    @course = Course.find(params[:id])
    if @course.update_attributes(title: params["course"][:title], sub_courses: sub_courses)
      redirect_to '/course_overview'
    else
      render 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.update_attribute(:archived, true)
    redirect_to '/course_overview'
  end
end
