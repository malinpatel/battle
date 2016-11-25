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
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    redirect to '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

 get '/attack' do
   @game = $game
   erb(:attack)
   redirect '/play'
 end

 get 'switch_name' do
   @game = $game
   erb(:switch_name)
   redirect '/play'
 end


  run! if app_file == $0

end
