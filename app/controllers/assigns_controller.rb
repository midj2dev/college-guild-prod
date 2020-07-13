class AssignsController < ApplicationController
  def create
    @volunteer = Volunteer.find(params[:volunteer_id])
    @unit = Unit.find(params[:unit_id])
    @volunteer.units << @unit
    if @unit.scan.url && params["email"] == "true"
      puts "Firing"
      flash[:success] = "Email Sent to Reader"
      UnitMailer.send_unit_to_volunteer(@unit, @volunteer).deliver_now
    end
    @unit.update_attribute(:reader_mailing_date, Date.today())
    flash[:success] = "Unit Assigned to #{@volunteer.name}"
    redirect_to @volunteer
  end

  def update
    @unit = Unit.find(params[:unit_id])
    @volunteer = Volunteer.find(params[:id])
    @volunteer.units.delete(@unit)
    @unit.update_attribute(:reader_mailing_date, nil)
    flash[:success] = "Unit Ready to be Reassigned"
    redirect_to @unit
  end
end
