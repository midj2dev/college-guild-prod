class CertificateController < ApplicationController
  def index
    respond_to do |format|
      format.csv { send_data Certificate.to_csv, filename: "certificates-#{Date.today}.csv" }
    end
  end

  def create
    @prisoner = Prisoner.find(params[:prisoner_id])
    @course = Course.find(params[:certificate][:course_id])
    @certificate = Certificate.create(mailing_date: Date.today)
    @course.certificates << @certificate
    @prisoner.certificates << @certificate
    redirect_to @prisoner
  end
end
