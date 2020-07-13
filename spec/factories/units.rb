FactoryGirl.define do
  factory :unit do

    # mailing_date "2016-05-02"
    # return_date "2016-05-07"
    scan "img string"

    # reader_mailing_date "2016-05-10"
    # reader_return_date "2016-05-15"
    reader_scan "img string"
  end
end
