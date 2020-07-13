class UnitMailer < ApplicationMailer

  def send_unit_to_volunteer(unit, volunteer)
    @unit = unit
    @volunteer = volunteer
    @prisoner = unit.prisoner
    mail(to: @volunteer.email, subject: "Here's your next unit #{@volunteer.first_name}")
  end

end
