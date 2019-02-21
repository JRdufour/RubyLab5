# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

for i in 1..49
  user = User.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.safe_email
  user.save

  for x in 1..3
    article = Article.new
    article.user = user
    article.title = Faker::TvShows::GameOfThrones.character
    article.content = Faker::TvShows::GameOfThrones.quote
    article.save

    for ii in 1..4
      comment = Comment.new
      comment.message = Faker::TvShows::GameOfThrones.quote
      comment.user = user
      comment.article = article
      comment.save

    end
  end
end