class CreateJoinTableCoursesVolunteers < ActiveRecord::Migration
  def change
    create_join_table :courses, :volunteers do |t|
      t.index [:course_id, :volunteer_id]
      t.index [:volunteer_id, :course_id]
    end
  end
end
