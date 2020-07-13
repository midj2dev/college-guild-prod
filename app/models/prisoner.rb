require 'csv'

class Prisoner < ActiveRecord::Base
	#Associations
	has_many :units, inverse_of: :prisoner, dependent: :destroy
	has_many :volunteers, through: :units
	has_many :certificates, dependent: :destroy
	has_and_belongs_to_many :courses

	#validations
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :prison_id, presence: true
	validates :address_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true

	def self.to_csv
		attributes = %w{first_name last_name address_1 prison_id enrollment_date city state comments created_at}

		CSV.generate(headers: true) do |csv|
			csv << attributes
			all.each do |prisoner|
				csv << attributes.map{ |attr| prisoner.send(attr) }
			end
		end
	end

	def self.report_rows
		%w(first_name last_name city state enrollment_date)
	end

  	def self.active(startDate, endDate)
		self.select { |x| x.units.first.created_at > start && x.units.first.created_at < endDate } 	
  	end

	def get_name(prisoner_id)
		self.select("first_name").where("id=#{prisoner_id}")
 	end

	def name
		# "#{first_name} #{last_name}"
		if [first_name, last_name].all?
			"#{first_name} #{last_name}"
		elsif [first_name, last_name].empty?
			""
		elsif !first_name.empty? && last_name.empty?
			"#{first_name}"
		else
			"#{last_name}"
		end
	end

	def full_address_1
		address_2 ? "#{address_1} + #{address_2}" : address_1
	end

	def full_address_2
		"#{city} #{state} #{zip}"
	end

	def courses_with_subcourses
		hash = Hash.new()
		units.each do |x|
			if x.course
				hash[x.course.title] = [] if hash[x.course.title].nil?
			end
			if x.course
				hash[x.course.title].push(x.sub_course) unless hash[x.course.title].include? x.sub_course
			end
		end
		hash
	end

	def courses_with_all_subcourses
		hash = Hash.new()
		units.each do |x|
			if x.course
				hash[x.course.title] = x.course.sub_courses if hash[x.course.title].nil?
			end
		end
		hash
	end

	def last_volunteer
		units ? units.last(2)[0].volunteer : nil
	end
end
