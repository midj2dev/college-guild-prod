require 'csv'

class Volunteer < ActiveRecord::Base
  store_accessor :vacation

	#Associations
	has_many :units, inverse_of: :volunteer
	has_many :prisoners, through: :units
	has_and_belongs_to_many :courses

  #Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :courses, presence: true

  def self.to_csv
    attributes = %w{first_name last_name email vacation college comments created_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |volunteer|
        csv << attributes.map{ |attr| volunteer.send(attr) }
      end
    end
  end

  def self.report_rows
    %w(first_name last_name email)
  end

  def name
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

  def all_courses?
    courses.length == Course.all.length
  end

  def active_units
    units.to_a.keep_if { |x| x.reader_return_date.nil? }
  end

  # def late_returner?
  #   arr = []
  #   units.each do |unit|
  #     unless unit.reader_return_date.nil?
  #       u = (unit.reader_return_date - unit.reader_mailing_date).to_i
  #       arr.push(u)
  #     end
  #   end
  #   mean = arr.reduce(:+).to_f / arr.length
  #   mean >= 200
  # end

  def self.find_matches(unit)
    vols = filter_by_course(unit)
    vols = available_vols(vols)
    Volunteer.rank(vols, unit)
  end

  def not_on_vacation
    return true unless vacation
    vacation.each do |k,v|
      return false if k.to_date < Date.today() && v.to_date > Date.today()
    end
    true
  end

  def ranking(unit)
    if unit.prisoner.last_volunteer == self
      return 100.0
    end
    1.0 / self.courses.length.to_f
  end

  private

  # Filter Volunteers by the units Course
  def self.filter_by_course(unit)
    Volunteer.all.to_a.keep_if {|x| x.courses.include? unit.course }
  end

  # Check if they have outstanding units
  def self.available_vols(vols)
    vols.keep_if {|x| x.active_units.empty? && x.not_on_vacation }
  end

  def self.rank(vols, unit)
    ranked_vols = vols.map! { |v| { volunteer: v, ranking: v.ranking(unit) } }
    ranked_vols.sort_by { |v| v[:ranking] }.reverse
  end
end
