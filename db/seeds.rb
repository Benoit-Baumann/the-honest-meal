#----- Destroying existing data -----
puts "Destroying existing coupons..."
Coupon.destroy_all

puts "Destroying existing favorites..."
Favorite.destroy_all

puts "Destroying existing reviews..."
Review.destroy_all

puts "Destroying existing restaurants..."
Restaurant.destroy_all

puts "Destroying existing users..."
User.destroy_all


#----- Creating new users -----

def create_new_user
  User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email ,
    password: 'password',
    status: rand(0..1)
  )
end

def create_new_restaurant
  Restaurant.new(
    name: Faker::Restaurant.name,
    category: Faker::Restaurant.type,
    address: Faker::Address.full_address,
    description: Faker::Restaurant.description,
    pricing: rand(1..3),
    rating: rand(0..5),
    phone_number: Faker::PhoneNumber.phone_number,
    website: Faker::Internet.domain_name
  )
end

def create_new_review
  Review.new(
    content: Faker::Restaurant.review,
    rating: rand(0..5)
  )
end


john = User.new(
  username: "John",
  email: "john@hotmail.fr",
  password: "password",
  status: 1
  )

ben = User.new(
  username: 'Ben',
  email: "ben@hotmail.fr",
  password: 'password',
  status: 1
)

juju = User.new(
  username: 'Juju',
  email: "juju@hotmail.fr",
  password: 'password',
  status: 0
)

axel = User.new(
  username: 'axel',
  email: "axel@hotmail.fr",
  password: 'password',
  status: 0
)

[john, ben].each do |owner| 
  resto = create_new_restaurant
  resto.owner = owner
  resto.save!
end


rand(10..20).times {
  owner = create_new_user
  resto = create_new_restaurant
  resto.owner = owner
  owner.save!
  resto.save!
}

rand(20-40).times {

  customer = create_new_user
  customer.save!

  rand(3..5).times {
    review = create_new_review
    review.restaurant = Restaurant.order('RANDOM()').first
    # if [true, false].sample
    if Faker::Boolean.boolean
      review.user = User.order('RANDOM()').first
    else
      review.username = Faker::Internet.username
    end
    review.save!
  }
}