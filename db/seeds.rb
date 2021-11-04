# frozen_string_literal: true

Gossip.destroy_all
User.destroy_all
City.destroy_all
Dm.destroy_all
JoinTagGossip.destroy_all
JoinUserDm.destroy_all
Tag.destroy_all
Like.destroy_all

# Création de 10 villes
30.times do
  City.create(
    name: Faker::Address.unique.city,
    zip_code: Faker::Address.zip
  )
end

# Création de 25 users
25.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 15),
    email: Faker::Internet.unique.email,
    age: rand(10..90),
    city: City.all.sample(1).first,
    password: Faker::Lorem.characters(number: 8)
  )
end

# Création de 20 gossips
20.times do |_i|
  Gossip.create(
    title: Faker::Hipster.word,
    content: Faker::Movie.quote,
    user: User.all.sample(1).first
  )
end
gossips_array = Gossip.all

# Création de 10 tags
10.times do
  Tag.create(
    title: Faker::SlackEmoji.unique.people
  )
end

# Création de la table tag/gossip
Gossip.all.each do |i|
  JoinTagGossip.create(
    gossip: i,
    tag: Tag.all.sample(1).first
  )
end

# Création des dms
50.times do
  Dm.create(
    content: Faker::Quote.yoda,
    sender: User.all.sample(1).first
  )
end

# Création de la table dm/receipient
Dm.all.each do |i|
  JoinUserDm.create(
    dm: i,
    recipient: User.all.sample(1).first
  )
end

# Création de la table comment
40.times do
  comment = Comment.create(
    content: Faker::TvShows::TwinPeaks.quote,
    gossip: Gossip.all.sample(1).first,
    user: User.all.sample(1).first
  )
end

# rajouter like
40.times do
  like = Like.create(
    gossip: Gossip.all.sample(1).first,
    user: User.all.sample(1).first
  )
end
