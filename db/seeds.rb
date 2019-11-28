start_time = Time.now

#----- Destroying existing data -----
puts "Destroying existing coupons..."
Coupon.destroy_all

puts "Destroying existing favorites..."
Favorite.destroy_all

puts "Destroying existing reviews..."
Review.destroy_all

puts "Destroying existing restaurant photos..."
RestaurantPhoto.destroy_all

puts "Destroying existing restaurants..."
Restaurant.destroy_all

puts "Destroying existing users..."
User.destroy_all

puts "Destroying answers..."
Answer.destroy_all

puts "Destroying questions..."
Question.destroy_all

puts "Destroying questionpools..."
QuestionPool.destroy_all


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
    website: Faker::Internet.domain_name,
    siret: rand(10**14)
  )
end

def create_new_review
  @rating = rand < 0.7 ? rand(4..5) : rand(1..5)
  Review.new(
    content: Faker::Restaurant.review,
    rating: @rating,
    content_title: 'Titre du contenu',
  )
end

puts "Creating user 'John' as owner..."
john = User.new(
  username: "John",
  email: "john@hotmail.fr",
  password: "password",
  status: 1
  )
john.save!

puts "Creating user 'Ben' as owner..."
ben = User.new(
  username: 'Ben',
  email: "ben@hotmail.fr",
  password: 'password',
  status: 1
)
ben.save!

puts "Creating user 'Juju' as customer..."
juju = User.new(
  username: 'Juju',
  email: "juju@hotmail.fr",
  password: 'password',
  status: 0
)
juju.save!

puts "Creating user 'Axel' as customer..."
axel = User.new(
  username: 'axel',
  email: "axel@hotmail.fr",
  password: 'password',
  status: 0
)
axel.save!

puts "Creating Question Pool for John"
question_pool_john = QuestionPool.new(
  user: john,
  nameq: 'Le questionnaire de John'
  )
question_pool_john.save!

# puts "Creating Questions for John"
# questions_john1 = Question.new(
#   name: 'Comment avez-vous trouvé le tiramisu ?',
#   cat: '0',
#   question_pool: question_pool_john
#   )

# questions_john2 = Question.new(
#   name: "Qu'avez-vous pensé du service ?",
#   cat: '0',
#   question_pool: question_pool_john
#   )

# questions_john3 = Question.new(
#   name: 'Quelle note donneriez-vous à la propreté ?',
#   cat: '1',
#   question_pool: question_pool_john
#   )

# questions_john1.save!
# questions_john2.save!
# questions_john3.save!

# puts "Creating answers for John"
# 5.times {
#     answer = Answer.new(
#               content: Faker::Restaurant.review,
#              question: questions_john1
#             )
#     answer.save!
# }

# 5.times {
#     answer2 = Answer.new(
#               content: Faker::Restaurant.review,
#              question: questions_john2
#             )
#     answer2.save!
# }

# 10.times {
#     answer3 = Answer.new(
#               content: rand(1..5).to_s,
#               question: questions_john3
#             )
#     answer3.save!
# }

puts "Creating Question Pool for Ben"
question_pool_ben = QuestionPool.new(
  user: ben,
  nameq: 'Le questionnaire de Ben'
  )
question_pool_ben.save!

puts "Creating Questions for Ben"
questions_ben1 = Question.new(
  name: "Que pensez-vous de la nouvelle décoration du restaurant ?",
  cat: '0',
  question_pool: question_pool_ben
  )

questions_ben2 = Question.new(
  name: 'Comment avez-vous trouvé la propreté des lieux ?',
  cat: '0',
  question_pool: question_pool_ben
  )

questions_ben3 = Question.new(
  name: 'Avez-vous été satifsait du service lors de votre visite ?',
  cat: '0',
  question_pool: question_pool_ben
  )

  questions_ben4 = Question.new(
  name: 'Avez-vous trouvé les quantités suffisantes ?',
  cat: '0',
  question_pool: question_pool_ben
  )

  questions_ben5 = Question.new(
  name: 'Comment noteriez-vous le rapport qualité/prix ?',
  cat: '1',
  question_pool: question_pool_ben
  )

questions_ben1.save!
questions_ben2.save!
questions_ben3.save!
questions_ben4.save!
questions_ben5.save!

puts "Creating answers for Ben"
rand(5..10).times {
  answer = Answer.create!(
            content: Faker::Restaurant.review,
            question: questions_ben1
          )
}
rand(5..10).times {
  answer = Answer.create!(
            content: Faker::Restaurant.review,
            question: questions_ben2
          )
}
rand(5..10).times {
  answer = Answer.create!(
            content: Faker::Restaurant.review,
            question: questions_ben3
          )
}
rand(5..10).times {
  answer = Answer.create!(
            content: Faker::Restaurant.review,
            question: questions_ben4
          )
}

rand(5..10).times {
    answer3 = Answer.create!(
              content: rand(1..5).to_s,
              question: questions_ben5
            )
}


puts "Creating random restaurants for John and Ben..."
[ben].each do |owner|
  resto = create_new_restaurant
  resto.owner = owner
  resto.save!
end

# rand_nb = rand(10..20)
# puts "Creating #{rand_nb} random restaurant owners and restaurants..."
# i =1
# rand_nb.times {
#   owner = create_new_user
#   owner.status = 1
#   resto = create_new_restaurant
#   resto.owner = owner
#   owner.save!
#   puts "---Creating owner #{i} with id:#{owner.id}"
#   resto.save!
#   puts "---Creating restaurant #{i} with id:#{resto.id}"
#   i += 1
# }

# rand_nb = rand(10..20)
# puts "Creating #{rand_nb} random users..."
# i = 1
# rand_nb.times {

#   customer = create_new_user
#   customer.save!
#   puts "---Creating customer #{i} with id:#{customer.id}"

  # rand_nb = rand(3..5)
  # puts "-----Creating #{rand_nb} random reviews for user_id=#{customer.id}..."
  j = 0
  rand(100..150).times {
    review = create_new_review
    # review.restaurant = Restaurant.order('RANDOM()').first
    review.restaurant = ben.restaurants.first
    if Faker::Boolean.boolean(true_ratio: 0.85)
      review.user = User.order('RANDOM()').first
    else
      review.username = Faker::Internet.username
    end
    review.save!
    # Randomize if a review is answered by a customer (with true_ratio = 0.91)
    review.created_at = rand(Date.civil(2019, 1, 1)..Date.civil(2019, 11, 29))
    if Faker::Boolean.boolean(true_ratio: 0.88)
      review.updated_at = review.created_at + (rand(1..7))
    else
      review.updated_at = review.created_at
    end
    review.save!
    puts "-------Creating review #{j} with id:#{review.id}"
    j += 1
  }

#   rand_nb = rand(0..3)
#   puts "-----Marking #{rand_nb} random restaurants as favorite for user_id=#{customer.id}..."
#   j = 0
#   rand_nb.times {
#     favorite = Favorite.new(value: true, user: customer)
#     favorite.restaurant = Restaurant.order('RANDOM()').first
#     favorite.save!
#     puts "-------Marking #{favorite.restaurant.name} as favorite"
#     j += 1
#   }

#   i += 1

# }

puts "Seed finished in #{ (Time.now - start_time).round(1) }s !"
