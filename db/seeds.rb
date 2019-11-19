# 1) seed des restos
 ChezPaulBocuse = Restaurant.new (name: 'Paul Bocuse',
    type: "Gastronomique",
    address: "Colonges au Mont d'or",
    description: "Le Restaurant du célèbre chef étoilé Lyonnais Paul Bocuse",
    pricing: "de 75 a 120€ le menu",
    rating: 4,
    phone_number: "04-12-34-56-78")

  McdoBellecours = Restaurant.new (name: 'Mcdo de la place Bellecours',
    type: "Fast-food",
    address: "Place bellecours, Lyon",
    description: "Un des nombreux restaurants de la chaine",
    pricing: "de 2 a 12€",
    rating: 3,
    phone_number: "04-12-34-56-78")


  ChezNino = Restaurant.new (name: 'Chez Nino',
    type: "Italien",
    address: "Place Bellecours, Lyon",
    description: "Pizza et auttres spécialités italiennes au menu dans une ambiance agréable a 2 pas de la place bellecours",
    pricing: "de 10 a 20€ le menu",
    rating: 4,
    phone_number: "04-12-34-56-78")



# 2) seed des users
John = User.new (
email: "john@hotmail.fr",
  )

# 3) seed des reviews
