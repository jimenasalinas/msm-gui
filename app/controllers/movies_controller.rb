class MoviesController < ApplicationController
  def create
    # params hash: {"the_title"=>"bn", "the_year"=>"2023", "the_duration"=>"345", "the_description"=>"interesting", "the_image"=>"na", "the_director_id"=>"23"}
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")

    m.save

    # Retrieve users inputs
    # Create a record
    # Populate each column with input

    #Redirect back to /movies
  end
  
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
