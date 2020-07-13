require 'csv'

task import_students: :environment do
  #Prisoner.delete_all
  file_path = "#{Rails.root}/public/CGStudentsImport.csv"
  CSV.foreach(file_path, headers: true, encoding: 'iso-8859-1') do |row|
    begin
      enrollment_date = Date.strptime(row.to_hash["enrollment_date"], "%m/%d/%y")
    rescue Exception
      enrollment_date = "unknown"
    end
    Prisoner.create(row.to_hash.except(nil, :enrollment_date).merge({enrollment_date: enrollment_date}))
  end
end
