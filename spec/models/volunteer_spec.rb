require 'rails_helper'

RSpec.describe Volunteer, type: :model do

  before(:each) do
    @courses = create_list(:course, 10)

    @prisoner = create(:prisoner)

    @unit1 = create(:unit, course: @courses.sample, prisoner: @prisoner, reader_return_date: 10.days.ago)
    @unit2 = create(:unit, course: @courses.first, prisoner: @prisoner)

    @vol1 = create(:volunteer, courses: @courses)
    @vol2 = create(:volunteer, courses: @courses[0..5])
    @vol4 = create(:volunteer, courses: @courses, vacation: {"2017-07-9" => "2017-07-15"})
    @vol5 = create(:volunteer, courses: @courses, units: [@unit1], first_name: "MATCH")
    @vol3 = create(:volunteer, courses: [@courses.first])
  end

  it "all courses" do
    expect(@vol1.all_courses?).to eq(true)
    expect(@vol2.all_courses?).to eq(false)
  end

  it "not on vacation" do
    expect(@vol4.not_on_vacation).to eq(false)
    expect(@vol2.not_on_vacation).to eq(true)
  end

  describe "ranking algo" do

    it "check unavailables" do
      matches = Volunteer.find_matches(@unit2)
      match_ids = matches.map { |m| m[:volunteer].id }
      expect(match_ids).to eq([@vol5.id, @vol3.id, @vol2.id, @vol1.id])
    end

  end

end
