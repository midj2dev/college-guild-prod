class AddSubCourseToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :sub_courses, :string, array: true
  end
end
