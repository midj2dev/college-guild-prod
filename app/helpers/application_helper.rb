module ApplicationHelper
  def report_table(class_name, records)
    rows = class_name.constantize.report_rows
    construct_table(rows, records)
  end

  def construct_table(rows, records)
    str = "<table id='record-datatable' class='table table-striped table-bordered'><thead><tr>"
    rows.each {|row| str += "<td>#{row.humanize}</td>" }
    str += "</tr></thead><tbody>"
    records.each do |record|
      str += "<tr class='table-row'>"
      rows.each {|row| str += "<td>#{record[row.to_s]}</td>"}
      str +="</tr>"
    end
    str += "</tbody></table>"
    str.html_safe
  end
end
