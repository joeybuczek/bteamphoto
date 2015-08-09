# Users - be sure to log in afterwards and change initial password

# Admin Account - Change as needed
admin = User.new(
	user_name: 				'bteamphoto',
	client_name: 			'bteamphoto',
	email: 					'bteamphoto@gmail.com',
	password: 				'password',
	password_confirmation: 	'password',
	name_primary: 			'Joey Buczek',
	name_secondary: 		'Allison Buczek',
	role: 					'admin'
)
admin.save

# Default User Account - for reviews, genres, etc. - Change as needed
default_user = User.new(
	user_name: 				'bteam_client',
	client_name: 			'bteam_client',
	email: 					'client@bteamphoto.com',
	password: 				'password',
	password_confirmation: 	'password',
	name_primary: 			'Default Client',
	name_secondary: 		'Default Client',
	street_address: 		'85 Focal Point',
	city: 					'Bokehville',
	state: 					'NY',
	country: 				'United States',
	zip_code: 				'70200',
	phone_home: 			'315-555-1234',
	phone_cell: 			'315-555-4321',
	role: 					'client'
)
default_user.save


# Collections - Change as needed
coll1 = Collection.new(
	name: 			'Wedding Gallery',
	description: 	'Wedding Photographs',
	genre: 			'wedding'
)
coll1.save
coll2 = Collection.new(
	name: 			'Baby and Children Portraiture',
	description: 	'Portraits of babies and children',
	genre: 			'children'
)
coll2.save


# Images - Change as needed
img = coll1.images.build(name: 'LaBrake-1.jpg', description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'Katie-1.jpg',   description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'Paige-1.jpg',   description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'LaBrake-2.jpg', description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'Katie-2.jpg',   description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'Paige-2.jpg',   description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'LaBrake-3.jpg', description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'Katie-3.jpg',   description: 'Wedding Photography', genre: 'wedding').save
img = coll1.images.build(name: 'Paige-3.jpg',   description: 'Wedding Photography', genre: 'wedding').save


# Reviews - Change as needed
default_user.reviews.build(
	genre: 'wedding',
	body:  'We are so happy with our beautiful photographs! We could not have asked for a better experience from Joey and Allie!'
).save
default_user.reviews.build(
	genre: 'wedding',
	body:  'Our photographs are fantastic! They are true professionals that made us feel at ease the entire day.'
).save
default_user.reviews.build(
	genre: 'children',
	body:  'We are thrilled with our photographs! Thank you so much!'
).save
default_user.reviews.build(
	genre: 'children',
	body:  'We will cherish our photographs forever!'
).save


# Verify
puts "Admin user created: #{ User.first.role == 'admin' }"
puts "Default user created: #{ User.last.role == 'client' }"
puts "Wedding collection created: #{ Collection.first.genre == 'wedding' }"
puts "Children collection created: #{ Collection.last.genre == 'children' }"
puts "Wedding photos added: #{ Image.all.count }"
puts "Wedding reviews created: #{ Review.where( genre: 'wedding' ).count }"
puts "Children reviews created: #{ Review.where( genre: 'children' ).count }"
