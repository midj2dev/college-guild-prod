require 'google_drive'

task export_volunteers: :environment do
  session = GoogleDrive::Session.from_config("google_drive_config.json")
  ws = session.spreadsheet_by_key("1vH4GKo9r7VG13aY60V8jz8_TyizFXUqfK5KFU_66PqE").worksheets[0]
    Volunteer.all.each_with_index do |v,i|
      arr = []
      v.courses.each do |c|
        arr.push(c.title)
      end
      ws[i+1,1] = v.first_name
      ws[i+1,2] = v.last_name
      ws[i+1,3] = v.email
      ws[i+1,4] = v.vacation
      ws[i+1,5] = arr
      ws.save
    end
end
