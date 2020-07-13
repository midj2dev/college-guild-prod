require 'csv'

class Unit < ActiveRecord::Base
  mount_uploader :scan, ScanUploader
  mount_uploader :reader_scan, ReaderScanUploader
  default_scope { order(mailing_date: :desc)}

  # Associations
  belongs_to :course
  belongs_to :prisoner
  belongs_to :volunteer

  # Validations
  # validates :course, presence: true
  # validates :prisoner, presence: true
  # validates :mailing_date, presence: true
  #validates :scan, presence: true

  def self.to_csv
    attributes = %w{course sub_course prisoner volunteer mailing_date return_date reader_mailing_date reader_return_date created_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |unit|
        csv << attributes.map do |attr| 
          if attr == 'course'
            unit.course.try(:title)
          elsif attr == 'sub_course'
            unit.sub_course
          elsif attr == 'prisoner'
            unit.prisoner.try(:name)
            # unit.prisoner.get_name(id: unit.prisoner_id)
          elsif attr == 'volunteer'
            unit.volunteer.try(:name)
          elsif attr == 'mailing_date'
            unit.mailing_date
          elsif attr == 'return_date'
            unit.return_date
          elsif attr == 'reader_mailing_date'
            unit.reader_mailing_date
          elsif attr == 'reader_return_date'
            unit.reader_return_date
          else
            unit.created_at
          end
          
          # if attr == 'prisoner1'
          #   unit.prisoner.name
          # end
          # elsif attr == 'volunteer'
          #   unit.volunteer.name
          # elsif attr == 'mailing_date'
          #   unit.course.try(:mailing_date)
          # elsif attr == 'return_date'
          #   unit.course.try(:return_date)
          # elsif attr == 'reader_mailing_date'
          #   unit.course.try(:reader_mailing_date)
          # elsif attr == 'reader_return_date'
          #   unit.course.try(:reader_return_date)
          # elsif attr == 'created_at'
          #   unit.course.try(:created_at)

          # all.each do |unit|
          #   csv << attributes.map do |attr| 
          #     if attr == 'course'
          #       unit.course.try(:title)
          #     elsif attr == 'volunteer'
          #       unit.volunteer.try(:name)
          #     elsif attr == 'prisoner'
          #       unit.prisoner.try(:name)
          #     else
          #       unit.send(attr)
          #     end
          #   end
          # end
        end
      end
    end
  end

  def self.report_rows
    %w(mailing_date return_date reader_mailing_date reader_return_date)
  end

  def status
    if return_date.nil?
      "Waiting on Student"
    elsif return_date && reader_mailing_date.nil?
      "Unassigned"
    elsif reader_mailing_date && reader_return_date.nil?
      "Waiting on Volunteer"
    elsif reader_return_date
      "Completed"
    end
  end

  def sub_course_abbr
    sub_course.truncate(20) if sub_course
  end

  def speed
    (return_date - mailing_date).to_i
  end

  def late?
    unless return_date
      (Date.today() - mailing_date).to_i >= 7
    end
  end

end
