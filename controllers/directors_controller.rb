class DirectorController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, File.join(root, 'views/')

  configure :development do
    register Sinatra::Reloader
  end

  get '/directors' do

    @title = 'Directors'
    @directors = Directors.all

    erb :'directors/index'
  end

  get '/directors/new' do

    @director = Directors.new
    erb :'directors/new'
  end

  get '/directors/:id' do
    id = params[:id].to_i
    @director = Directors.find_director(id)
    @title = @director.name

    erb :'directors/show'
  end

  post '/directors/' do
    director = Directors.new
    director.name = params[:name]
    director.save

    redirect '/directors'
  end

  get '/directors/:id/edit' do
    id = params[:id].to_i
    @director = Directors.find_director(id)

    erb :'directors/edit'
  end

  put '/directors/:id' do
    id = params[:id].to_i
    director = Directors.find_director(id)
    director.name = params[:name]
    director.save

    redirect '/directors'
  end

  delete '/directors/:id' do
    id = params[:id].to_i
    Directors.delete(id)

    redirect '/directors'
  end
end
