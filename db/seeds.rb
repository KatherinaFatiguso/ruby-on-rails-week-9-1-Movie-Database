# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

search1 = Imdb::Search.new("Avengers")
search1.movies.each do |im_movie|
  movie = Movie.create(
    title: im_movie.title,
    poster: im_movie.poster,
    year: im_movie.year,
    rating: im_movie.rating
  )

  puts im_movie.title
  im_movie.cast_members.each do |cm|
    movie.stars << Star.find_or_create_by!(name: cm)
=begin
    if Star.exists?(name: cm)
      star = Star.find_by(name: cm)
      movie.stars << star
    else
      movie.stars.create(name: cm)
    end
=end
  end

  im_movie.genres.each do |g|
    movie.genres << Genre.find_or_create_by!(name: g)
=begin
    if Genre.exists?(name: g)
      genre = Genre.find_by(name: g)
      movie.genres << genre
    else
      movie.genres.create(name: g)
    end
=end    
  end
end
