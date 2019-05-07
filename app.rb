require 'sinatra'
require 'sinatra/contrib'
require_relative './models/films.rb'
require_relative './models/directors.rb'
require_relative './controllers/home_controller'
require_relative './controllers/films_controller'
require_relative './controllers/directors_controller'

class App < Sinatra::Base
  use HomeController
  use FilmController
  use DirectorController
end
