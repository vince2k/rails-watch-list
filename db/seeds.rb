# Clear all tables first
puts "Cleaning database..."
Bookmark.destroy_all if Rails.env.development?
List.destroy_all if Rails.env.development?
Movie.destroy_all if Rails.env.development?

# Create movies
puts "Creating movies..."
movies = [
  {
    title: "Wonder Woman 1984",
    overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
    poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
    rating: 6.9
  },
  {
    title: "The Shawshank Redemption",
    overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
    poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
    rating: 8.7
  },
  {
    title: "Titanic",
    overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
    poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
    rating: 7.9
  },
  {
    title: "Ocean's Eight",
    overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
    poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
    rating: 7.0
  },
  {
    title: "The Dark Knight",
    overview: "Batman raises the stakes in his war on crime in Gotham City",
    poster_url: "https://image.tmdb.org/t/p/original/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg",
    rating: 9.0
  },
  {
    title: "Inception",
    overview: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
    poster_url: "https://image.tmdb.org/t/p/original/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg",
    rating: 8.8
  },
  {
    title: "Pulp Fiction",
    overview: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
    poster_url: "https://image.tmdb.org/t/p/original/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
    rating: 8.9
  },
  {
    title: "The Matrix",
    overview: "A computer programmer discovers that reality as he knows it is a simulation created by machines, and joins a rebellion to break free.",
    poster_url: "https://image.tmdb.org/t/p/original/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
    rating: 8.7
  },
  {
    title: "Forrest Gump",
    overview: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.",
    poster_url: "https://image.tmdb.org/t/p/original/clolk7rB5lAjs41SD0Vt6IXYLMm.jpg",
    rating: 8.8
  },
  {
    title: "Fight Club",
    overview: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.",
    poster_url: "https://image.tmdb.org/t/p/original/8kNruSfhk5IoE4eZOc4UpvDn6tq.jpg",
    rating: 8.8
  },
  {
    title: "Goodfellas",
    overview: "The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito.",
    poster_url: "https://image.tmdb.org/t/p/original/6QMSLvU5ziIL2T6VrkaKzN2YkxK.jpg",
    rating: 8.7
  },
  {
    title: "The Silence of the Lambs",
    overview: "A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer.",
    poster_url: "https://image.tmdb.org/t/p/original/rplLJ2hPcOQmkFhTqUte0MkEaO2.jpg",
    rating: 8.6
  },
  {
    title: "Interstellar",
    overview: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    poster_url: "https://image.tmdb.org/t/p/original/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
    rating: 8.6
  },
  {
    title: "The Green Mile",
    overview: "The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.",
    poster_url: "https://image.tmdb.org/t/p/original/velWPhVMQeQKcxggNEU8YmIo52R.jpg",
    rating: 8.5
  },
  {
    title: "Gladiator",
    overview: "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.",
    poster_url: "https://image.tmdb.org/t/p/original/tjrX2oWRCM3Tvarz38zlZM7Uc10.jpg",
    rating: 8.5
  },
  {
    title: "The Departed",
    overview: "An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.",
    poster_url: "https://image.tmdb.org/t/p/original/nT97ifVT2J1yMQmeq20Qblg61T.jpg",
    rating: 8.5
  },
  {
    title: "The Pianist",
    overview: "A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.",
    poster_url: "https://image.tmdb.org/t/p/original/5jkE2SzR5uR2egEb1rRhF22JyWN.jpg",
    rating: 8.5
  },
  {
    title: "Seven",
    overview: "Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.",
    poster_url: "https://image.tmdb.org/t/p/original/6yoghtyTpznpBik8EngEmJskVUO.jpg",
    rating: 8.6
  },
  {
    title: "The Usual Suspects",
    overview: "A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat.",
    poster_url: "https://image.tmdb.org/t/p/original/bUPmtQzrRhzqYySeiMpI7WHDidk.jpg",
    rating: 8.5
  },
  {
    title: "The Lion King",
    overview: "A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.",
    poster_url: "https://image.tmdb.org/t/p/original/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg",
    rating: 8.5
  },
  {
    title: "Whiplash",
    overview: "A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student's potential.",
    poster_url: "https://image.tmdb.org/t/p/original/6uSPcdGHA1WcEpYyvxQHAZNVqmE.jpg",
    rating: 8.5
  },
  {
    title: "The Prestige",
    overview: "After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.",
    poster_url: "https://image.tmdb.org/t/p/original/5MXyQfz8xUP3dIFPTu8lexpxoMy.jpg",
    rating: 8.5
  },
  {
    title: "Memento",
    overview: "A man with short-term memory loss attempts to track down his wife's murderer.",
    poster_url: "https://image.tmdb.org/t/p/original/yuNs09hvpHVU1cBqUTPh9NyLhNF.jpg",
    rating: 8.4
  },
  {
    title: "Apocalypse Now",
    overview: "A U.S. Army officer serving in Vietnam is tasked with assassinating a renegade Special Forces Colonel who sees himself as a god.",
    poster_url: "https://image.tmdb.org/t/p/original/gQB8Y5RCMkv2zwzFHbUJX3kAhvA.jpg",
    rating: 8.4
  },
  {
    title: "Alien",
    overview: "After a space merchant vessel receives an unknown transmission as a distress call, one of the crew is attacked by a mysterious life form.",
    poster_url: "https://image.tmdb.org/t/p/original/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg",
    rating: 8.4
  },
  {
    title: "Cinema Paradiso",
    overview: "A filmmaker recalls his childhood when falling in love with the pictures at the cinema of his home village and forms a deep friendship with the cinema's projectionist.",
    poster_url: "https://image.tmdb.org/t/p/original/8SRUfRUi6x4O68n0VCbDNRa6iGL.jpg",
    rating: 8.5
  },
  {
    title: "Django Unchained",
    overview: "With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.",
    poster_url: "https://image.tmdb.org/t/p/original/7oWY8VDWW7thTzWh3OKYRkWUlD5.jpg",
    rating: 8.4
  },
  {
    title: "The Grand Budapest Hotel",
    overview: "The adventures of Gustave H, a legendary concierge at a famous European hotel, and Zero Moustafa, the lobby boy who becomes his most trusted friend.",
    poster_url: "https://image.tmdb.org/t/p/original/eWdyYQreja6JGCzqHWXpWHDrrPo.jpg",
    rating: 8.1
  },
  {
    title: "La La Land",
    overview: "While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.",
    poster_url: "https://image.tmdb.org/t/p/original/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg",
    rating: 8.0
  },
  {
    title: "Parasite",
    overview: "Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.",
    poster_url: "https://image.tmdb.org/t/p/original/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
    rating: 8.6
  }
]

movies.each do |movie_data|
  movie = Movie.create!(movie_data)
  puts "Created #{movie.title}"
end

puts "Finished!"
