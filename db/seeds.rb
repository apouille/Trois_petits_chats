1.times do
	user = User.create!(
		email: "troispetitschats@yopmail.com",
		password: "test1234",
    is_admin: true
	)
end

1.times do
  profile = Profile.create!(
    first_name: 'John',
    last_name: 'Doe',
    street: '19 rue de THP',
    city: 'THP-City',
    zip_code: "75000",
    phone_number: "0607080910",
    user: User.first
  )
end
