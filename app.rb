require 'pry'
require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  attr_reader :player1, :player2

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    $game = Game.new(Player.new(params[:player1]), Player.new(params[:player2]))
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/attack' do
    if $game.game_over?
      redirect '/game_over'
    else
      redirect '/attack'
    end
  end

   get '/attack' do
     @game = $game
     erb(:attack)
     redirect '/play'
   end

   get '/game_over' do
     @game = $game
     erb(:game_over)
   end



  run! if app_file == $0

end
