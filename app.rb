require 'sinatra/base'
require 'capybara'
require_relative 'lib/game.rb'

Capybara.app

class Rps < Sinatra::Base

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  get '/1_player' do
    erb :oneplayername
  end

  get '/2_player' do
    erb :twoplayername
  end

  post '/1_player_name' do
    @game = Game.create(params[:p1_name], 'computer')
    redirect '/move_1_player'
  end

  post '/2_player_name' do
    @game = Game.create(params[:p1_name], params[:p2_name])
    redirect '/move_2_player'
  end

  get '/move_1_player' do
    erb :moveoneplayer
  end

  get '/move_2_player' do
    erb :movetwoplayer
  end

  post '/calculating_p1' do
    @game.move(params[:select], 'computer')
    redirect '/result'
  end

  post '/calculating_p2' do
    @game.move(params[:select_p1], params[:select_p2])
    redirect '/result'
  end

  get '/result' do
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
