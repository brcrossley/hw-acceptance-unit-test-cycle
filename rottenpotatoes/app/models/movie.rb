class Movie < ActiveRecord::Base

  attr_accessor :title, :rating, :description, :release_date, :director
 
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
def self.find_with_same_director(id)
    movie = self.find(id)
    if not movie.director.empty?
 	movies = self.where(:director => movie.director)
	return [movie, movies, false]
    else
	return [movie, [], true]
    end
  end
end
