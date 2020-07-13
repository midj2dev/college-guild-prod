class Report < ApplicationRecord

  # Associations
  has_many :prisoners
  has_many :volunteers
  has_many :units
  has_many :courses
  has_many :certificates

end
