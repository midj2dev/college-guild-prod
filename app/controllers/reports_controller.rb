class ReportsController < ApplicationController
  def index
    @reports = Report.pluck(:title, :model, :query, :id)
  end

  def show
    @report = Report.find(params[:id])
    @result_records = @report.result_records

    respond_to do |format|
      format.html
      format.xls
    end
  end

  def create
    model = report_params[:model].constantize
    n_conditions = report_params[:conditions].length
    records = []
    n_conditions.times do |n|
      condition = report_params[:conditions][n.to_s]
      if condition[:comparison] == "=="
        query = condition[:attribute].to_sym
        records = n > 0 ? records.where(query => condition[:value]) : model.where(query => condition[:value]) 
      else
        query = condition[:attribute] + " " + condition[:comparison] + " ?"
        records = n > 0 ? records.where(query, condition[:value]) : model.where(query, condition[:value])   
      end
    end
    @report = Report.create!(result_records: records, title: report_params[:title], model: report_params[:model], query: [report_params[:conditions]])
    redirect_to report_path(@report)
  end

  def new
    @report = Report.new
    @model_opts = [['Volunteer','Volunteer'], ['Student','Prisoner'], ['Unit', 'Unit']]
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  def attrs
    @model_attrs = {
      'Volunteer' => ['created_at', 'college', 'vacation'],
      'Prisoner' => ['created_at', 'enrollment_date', 'city', 'state', 'waitlist_date'],
      'Unit' => ['mailing_date', 'return_date', 'reader_mailing_date', 'reader_return_date'] 
    }
    render json: @model_attrs[params[:model]]
  end

  private

  def report_params
    params.require(:report).permit(:title, :model, :conditions => [:attribute, :comparison, :value]).to_h
  end
end
