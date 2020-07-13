class UnitsController < ApplicationController
  def show
    @unit = Unit.find(params[:id])
    @matches = Volunteer.find_matches(@unit)
    p @matches
    if @unit.status == "Unassigned"
      @title = "Assign"
    end
  end

  def create
   	@prisoner = Prisoner.find(params[:prisoner_id])
  	@unit = @prisoner.units.build(unit_params)
  	if @unit.save
      sub_course = Course.find(params[:unit][:course_id]).sub_courses[params[:unit][:sub_course].to_i]
      @unit.update_attribute(:sub_course, sub_course)
  		redirect_to @unit
  	else
  		render "prisoners/show"
  	end
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.update_attributes(unit_params)
    redirect_to @unit
  end

  def index
    units = Unit.all
    # units = Unit.scoped
    @unassigned = units.select { |x| x.status == "Unassigned" }
    @waiting = units.select { |x| x.status == "Waiting on Volunteer" }
    @waiting_student = units.select { |x| x.status == "Waiting on Student" }

    respond_to do |format|
      expires_in 3.minutes, :public => true
      format.html
      format.csv { send_data Unit.to_csv, filename: "units-#{Date.today}.csv" }
    end
  end

  def completed_units
    # @units = Unit.where.not(reader_return_date: nil).paginate(:page => params[:page])
    @units = Unit.where.not(reader_return_date: nil)

    # @units = Unit.all.select { |u| u.status == "Completed" }
  end

  def find_sub_courses
    render json: Course.find(params[:id]).sub_courses.to_json
  end

  def late
    @units = Unit.all.select { |unit| unit.reader_mailing_date && unit.reader_mailing_date < (Date.today - 7.days) && unit.reader_return_date.nil? }
  end

  private

  	def unit_params
  		params.require(:unit).permit(:mailing_date, :prison_id, :course_id, :scan, :return_date, :reader_scan, :reader_mailing_date, :reader_return_date)
  	end

end
