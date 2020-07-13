require 'csv'

class Certificate < ActiveRecord::Base
  belongs_to :course
  belongs_to :prisoner

  def self.to_csv
    attributes = %w{course mailing_date created_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |volunteer|
        csv << attributes.map do |attr| 
          if attr == 'course'
            volunteer.course.title
          else
            volunteer.send(attr)
          end
        end
      end
    end
  end
end
