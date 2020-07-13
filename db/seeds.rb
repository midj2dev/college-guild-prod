100.times do |n|
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	address_1 = Faker::Address.street_address
	if rand > 0.5
		address_2 = Faker::Address.secondary_address
	end
	prison_id = rand(5000)
	enrollment_date = Faker::Date.backward(800)
	city = Faker::Address.city
	state = Faker::Address.state
	zip = Faker::Address.zip
	Prisoner.create!(first_name: first_name, last_name: last_name, address_1: address_1,
		address_2: address_2, prison_id: prison_id, enrollment_date: enrollment_date,
		city: city, state: state, zip: zip)
end

100.times do |n|
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = 'collegeguild@gmail.com'
	rand = rand(26) + 1
	Volunteer.create!(first_name: first_name, last_name: last_name, email: email, course_ids: Course.pluck(:id).sample(rand))
end

Prisoner.all.each do |x|
	if rand > 0.2
		rand(10).times do |n|
			mailing_date = Faker::Date.backward(200)
			return_date = mailing_date + rand(30)
			volunteer_id = Volunteer.all.sample.id
			reader_mailing_date = return_date + 5.days
			reader_return_date = reader_mailing_date + rand(50)
			course = Course.all.sample
			x.units.create!(course_id: course.id, mailing_date: mailing_date, volunteer_id: volunteer_id, return_date: return_date,
				sub_course: course.sub_courses.sample, reader_mailing_date: reader_mailing_date, reader_return_date: reader_return_date)
		end
	end
end

# User.create(name: 'College Guild', password: 'CGuild2016$')





