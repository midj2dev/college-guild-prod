class Course < ActiveRecord::Base

	#Associations
	has_many :units, inverse_of: :course
	has_and_belongs_to_many :volunteers, inverse_of: :courses
	has_and_belongs_to_many :prisoners
  has_many :certificates

  scope :active, -> { where(archived: false) }

end
