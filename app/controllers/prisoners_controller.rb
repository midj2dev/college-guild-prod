class PrisonersController < ApplicationController

  def create
  	@prisoner = Prisoner.new(prisoner_params)
  	if @prisoner.save
  		redirect_to @prisoner
  	else
  		render 'new'
  	end
  end

  def update
    @prisoner = Prisoner.find(params[:id])
    if @prisoner.update_attributes(prisoner_params)
      redirect_to @prisoner
    else
      render 'edit'
    end
  end

  def show
  	@prisoner = Prisoner.find(params[:id])
    @unit = @prisoner.units.build
    @units = @prisoner.units
    @courses = @prisoner.courses_with_subcourses
    @all_courses = @prisoner.courses_with_all_subcourses
    @certificate = @prisoner.certificates.build
  end

  def index
    @prisoners = Prisoner.all.select { |x| x.enrollment_date }

    respond_to do |format|
      format.html
      format.csv { send_data Prisoner.to_csv, filename: "students-#{Date.today}.csv" }
    end
  end

  def edit
    @prisoner = Prisoner.find(params[:id])
  end

  def dictionary
    @prisoner = Prisoner.find(params[:prisoner][:id])
    @prisoner.update_attribute(:dictionary, true)
    @prisoner.update_attribute(:dictionary_sent, Date.today())
    redirect_to @prisoner
  end

  def waitlist
    @prisoners = Prisoner.all.select { |x| x.enrollment_date.nil? }
  end

  private

  	def prisoner_params
  		params.require(:prisoner).permit(:first_name, :last_name, :address_1,
		    :address_2, :prison_id, :waitlist_date, :city, :state, :zip, :dictionary_sent, :comments, :enrollment_date)
  	end

end
