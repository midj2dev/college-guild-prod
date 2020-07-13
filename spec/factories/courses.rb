FactoryGirl.define do
  factory :course do
    sequence :title do |n|
      Faker::GameOfThrones.house + n.to_s
    end
  end
end
