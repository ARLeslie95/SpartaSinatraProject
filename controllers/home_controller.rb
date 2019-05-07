class HomeController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, File.join(root, 'views')

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

    @films = Films.all
    @title = 'Welcome to the Movie Database'
    erb :'home/index'

  end

end
