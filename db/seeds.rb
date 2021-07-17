require 'json'
require 'open-uri'
puts 'remove old movies'
Movie.destroy_all
puts 'creating a bunch of movies'
url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(open(url).read)

movies["results"].each do |movie|
  new_movie = Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  )
  puts new_movie.title
end


