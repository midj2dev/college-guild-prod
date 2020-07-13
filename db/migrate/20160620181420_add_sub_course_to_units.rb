class AddSubCourseToUnits < ActiveRecord::Migration
  def change
    add_column :units, :sub_course, :string
  end
end
