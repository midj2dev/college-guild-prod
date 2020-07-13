class VolunteersController < ApplicationController
  protect_from_forgery except: [:vacation, :delete_vacation]

  def create
    @volunteer = Volunteer.new(vol_params)
    if @volunteer.save
      redirect_to @volunteer
    else
      render 'new'
    end
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update_attributes(vol_params)
      redirect_to @volunteer
    else
      render 'edit'
    end
  end

  def show
    @volunteer = Volunteer.find(params[:id])
    @courses = @volunteer.all_courses? ? "All Courses" : @volunteer.courses
    @prisoners = @volunteer.prisoners.uniq
    @units = @volunteer.units
    if @volunteer.vacation
      @vacation = @volunteer.vacation.select {|k,v| v.to_date > Date.today()}
    end
  end

  def index
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html
      format.csv { send_data Volunteer.to_csv, filename: "readers-#{Date.today}.csv" }
    end
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def vacation
    @volunteer = Volunteer.find(params[:volunteer][:id])
    if @volunteer.vacation
      @volunteer.update_attribute(:vacation, @volunteer.vacation.merge({params[:volunteer][:vacation_1] => params[:volunteer][:vacation_2]}))
    else
      @volunteer.update_attribute(:vacation,{params[:volunteer][:vacation_1] => params[:volunteer][:vacation_2]})
    end
    redirect_to @volunteer
  end

  def delete_vacation
    @volunteer = Volunteer.find(params[:volunteer][:id])
    @new_vacation = @volunteer.vacation.delete_if {|k,v| k == params[:volunteer][:vac1] && v == params[:volunteer][:vac2]}
    @volunteer.update_attribute(:vacation, @new_vacation)
    redirect_to @volunteer
  end

  private

    def vol_params
      params.require(:volunteer).permit(:first_name, :last_name, :email, :comments, course_ids: [])
    end

end
