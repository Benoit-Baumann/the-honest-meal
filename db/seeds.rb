start_time = Time.now

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
  Review.new(
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    content_title: 'Titre du contenu',
    created_at: rand(Date.civil(2019, 1, 1)..Date.civil(2019, 12, 31))
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

puts "Creating Questions for John"
questions_john1 = Question.new(
  name: 'Ques pensez vous du Tiramisu',
  cat: '0',
  question_pool: question_pool_john
  )

questions_john2 = Question.new(
  name: 'Que pensez vous du service ?',
  cat: '0',
  question_pool: question_pool_john
  )

questions_john3 = Question.new(
  name: 'Quel note donneriez vous a la propreté ?',
  cat: '1',
  question_pool: question_pool_john
  )

questions_john1.save!
questions_john2.save!
questions_john3.save!

puts "Creating answers for John"
5.times {
    answer = Answer.new(
              content: Faker::Restaurant.review,
             question: questions_john1
            )
    answer.save!
}

5.times {
    answer2 = Answer.new(
              content: Faker::Restaurant.review,
             question: questions_john2
            )
    answer2.save!
}

10.times {
    answer3 = Answer.new(
              content: rand(1..5).to_s,
              question: questions_john3
            )
    answer3.save!
}

puts "Creating Question Pool for Ben"
question_pool_ben = QuestionPool.new(
  user: ben,
  nameq: 'Le questionnaire de Ben'
  )
question_pool_ben.save!

puts "Creating Questions for Ben"
questions_ben1 = Question.new(
  name: 'Ques pensez vous du Risotto',
  cat: '0',
  question_pool: question_pool_ben
  )

questions_ben2 = Question.new(
  name: 'Les plats sont-ils assez salées ?',
  cat: '0',
  question_pool: question_pool_ben
  )

questions_ben3 = Question.new(
  name: 'Quel note donneriez vous a la serveuse ?',
  cat: '1',
  question_pool: question_pool_ben
  )

questions_ben1.save!
questions_ben2.save!
questions_ben3.save!

puts "Creating answers for Ben"
5.times {
    answer = Answer.new(
              content: Faker::Restaurant.review,
             question: questions_ben1
            )
    answer.save!
}

5.times {
    answer2 = Answer.new(
              content: Faker::Restaurant.review,
             question: questions_ben2
            )
    answer2.save!
}

10.times {
    answer3 = Answer.new(
              content: rand(1..5).to_s,
              question: questions_ben3
            )
    answer3.save!
}

puts "Creating random restaurants for John and Ben..."
[john, ben].each do |owner|
  resto = create_new_restaurant
  resto.owner = owner
  resto.save!
end

rand_nb = rand(10..20)
puts "Creating #{rand_nb} random restaurant owners and restaurants..."
i =1
rand_nb.times {
  owner = create_new_user
  owner.status = 1
  resto = create_new_restaurant
  resto.owner = owner
  owner.save!
  puts "---Creating owner #{i} with id:#{owner.id}"
  resto.save!
  puts "---Creating restaurant #{i} with id:#{resto.id}"
  i += 1
}

rand_nb = rand(20..40)
puts "Creating #{rand_nb} random users..."
i = 1
rand_nb.times {

  customer = create_new_user
  customer.save!
  puts "---Creating customer #{i} with id:#{customer.id}"

  rand_nb = rand(3..5)
  puts "-----Creating #{rand_nb} random reviews for user_id=#{customer.id}..."
  j = 0
  rand_nb.times {
    review = create_new_review
    review.restaurant = Restaurant.order('RANDOM()').first
    if Faker::Boolean.boolean
      review.user = User.order('RANDOM()').first
    else
      review.username = Faker::Internet.username
    end
    review.save!
    puts "-------Creating review #{j} with id:#{review.id}"
    j += 1
  }

  rand_nb = rand(0..3)
  puts "-----Marking #{rand_nb} random restaurants as favorite for user_id=#{customer.id}..."
  j = 0
  rand_nb.times {
    favorite = Favorite.new(value: true, user: customer)
    favorite.restaurant = Restaurant.order('RANDOM()').first
    favorite.save!
    puts "-------Marking #{favorite.restaurant.name} as favorite"
    j += 1
  }

  i += 1

}

puts "Seed finished in #{ (Time.now - start_time).round(1) }s !"
