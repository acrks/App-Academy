# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

# IMPORTANT:
# For all of the following problems return an ActiveRecord::Association unless
# otherwise specified. 

def star_wars_movies
  # Find the id, title and year of each of the "Star Wars" movies
  Movie
  .select(:id, :title, :yr)
  .where('title like \'Star Wars%\'')
end

def stewart_movies
  # Find the id, title, and score of all the movies the actor "Patrick Stewart"
  # was in.
  Movie
  .select(:id, :title, :score)
  .joins(:actors)
  .where('name = \'Patrick Stewart\'')
end

def actor_ids_from_grease
  # Return an array (NOT an ActiveRecord:Association) of the `ids` of 
  # all the actors that were in the movie "Grease"
  Movie
  .joins(:castings)
  .where('title = \'Grease\'')
  .pluck('castings.actor_id')
end

def al_pacino_not_number_one
  # Find the id and title of all movies in which Al Pacino
  # appeared but not as a lead actor.

  # Reminder: In the castings table the lead actor for a movie will
  # have an ord = 1 
  Movie
  .select(:id, :title)
  .joins(:actors)
  .where('name = \'Al Pacino\'')
  .where.not('ord = 1')
end

def smallest_cast
  # Find the id and title of the 3 movies with the
  # smallest casts (i.e least amount of actors)
  Movie
  .select(:id, :title)
  .group(:id)
  .joins(:castings)
  .order('COUNT(castings.actor_id)')
  .limit(3)
end