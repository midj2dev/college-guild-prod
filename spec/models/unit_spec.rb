require 'rails_helper'

RSpec.describe Unit, type: :model do
  before(:each) do
    @unit = create(:unit)
  end

  it 'sub course abbr' do
    expect(@unit.sub_course_abbr).to eq("Long final scienc...")
  end

  context 'unit status checks' do
    it 'Waiting on Student' do
      @waiting_on_student = create(:unit, return_date: nil, reader_mailing_date: nil, reader_return_date: nil)
      expect(@waiting_on_student.status).to eq("Waiting on Student")
    end
    it 'Unassigned' do
      @unassigned_unit = create(:unit, reader_mailing_date: nil, reader_return_date: nil)
      expect(@unassigned_unit.status).to eq("Unassigned")
    end
    it 'Waiting on Volunteer' do
      @waiting_on_vol = create(:unit, reader_return_date: nil)
      expect(@waiting_on_vol.status).to eq("Waiting on Volunteer")
    end
    it 'Completed' do
      expect(@unit.status).to eq("Completed")
    end
  end
end
