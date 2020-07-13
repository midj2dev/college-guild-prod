require 'rails_helper'
require 'spec_helper'

RSpec.describe Prisoner, type: :model do

  before(:each) do
    @prisoner = create(:prisoner)
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:prison_id) }
  it { should validate_presence_of(:address_1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }

  it 'full name' do
    expect(@prisoner.name).to eq("#{@prisoner.first_name} #{@prisoner.last_name}")
  end

  it 'full address 1' do
    expect(@prisoner.full_address_1).to eq(@prisoner.address_1)
  end

  it 'full address 2' do
    expect(@prisoner.full_address_2).to eq("#{@prisoner.city} #{@prisoner.state} #{@prisoner.zip}")
  end

end
