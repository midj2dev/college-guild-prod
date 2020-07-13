module ReportsHelper
  def query_row
    '<div class="query-helper"><input type="text" class="query-attribute form-control" placeholder="Attribute" /><select class="form-control"><option value="==">== Equal</option><option value=">=">>= Greater than or Equal to</option><option value="<="><= Less than or Equal to</option><option value=">">> Greater than</option><option value="<">< Less than</option></select><input type="text" class="query-value form-control" placeholder="value" /></div>'.html_safe
  end
end