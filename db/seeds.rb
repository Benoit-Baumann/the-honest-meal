Restaurant.destroy_all
User.destroy_all

# 1) seed des users
john = User.new(
email: "john@hotmail.fr",
  )

# 2) seed des restos

 chezpaulbocuse = Restaurant.new(name: 'Paul Bocuse',
    category: "Gastronomique",
    address: "Colonges au Mont d'or",
    description: "Le Restaurant du célèbre chef étoilé Lyonnais Paul Bocuse",
    pricing: "de 75 a 120€ le menu",
    rating: 4,
    phone_number: "04-12-34-56-78",
    owner: john)

 chezpaulbocuse.save!

  mcdobellecours = Restaurant.new(name: 'Mcdo de la place Bellecours',
    category: "Fast-food",
    address: "Place bellecours, Lyon",
    description: "Un des nombreux restaurants de la chaine",
    pricing: "de 2 a 12€",
    rating: 3,
    phone_number: "04-12-34-56-78",
    owner: john)

  mcdobellecours.save!

  cheznino = Restaurant.new(name: 'Chez Nino',
    category: "Italien",
    address: "Place Bellecours, Lyon",
    description: "Pizza et auttres spécialités italiennes au menu dans une ambiance agréable a 2 pas de la place bellecours",
    pricing: "de 10 a 20€ le menu",
    rating: 4,
    phone_number: "04-12-34-56-78",
    owner: john)

  cheznino.save!

# 3) seed des reviews
