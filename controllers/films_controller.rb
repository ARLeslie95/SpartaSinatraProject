class FilmController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, File.join(root, 'views/')

  configure :development do
    register Sinatra::Reloader
  end

  get '/films' do
    @title = 'Films'
    @films = Films.all
    erb :'films/index'
  end

  get '/films/new' do
    @title = 'New Movie'
    @film = Films.new
    @director = Directors.new
    erb :'films/new'
  end

  get '/films/:id' do
    id = params[:id].to_i
    @film = Films.find_film(id)
    @title = @film.name

    erb :'films/show'
  end

  post '/films/' do

    film = Films.new
    film.name = params[:name]
    film.logo = params[:logo]
    director = Directors.new
    director.name = params[:director]
    # if (Directors.get_director_id(director.name))
    #   film.director_id = Directors.get_director_id(director.name)
    # else
      director.save
      film.director_id = Directors.get_director_id(director.name)
    # end

    film.save

    redirect "/films"
  end

  get '/films/:id/edit' do
    id = params[:id].to_i
    @film = Films.find_film(id)

    erb :'films/edit'
  end

  put '/films/:id' do
    id = params[:id].to_i
    film = Films.find_film(id)
    film.name = params[:name]
    film.logo = params[:logo]
    film.save

    redirect "/films"
  end

  delete '/films/:id' do
    id = params[:id].to_i
    Films.delete(id)

    redirect "/films"
  end
end
