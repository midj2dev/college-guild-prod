class CreateJoinTableCoursesPrisoners < ActiveRecord::Migration
  def change
    create_join_table :courses, :prisoners do |t|
      t.index [:course_id, :prisoner_id]
      t.index [:prisoner_id, :course_id]
    end
  end
end
