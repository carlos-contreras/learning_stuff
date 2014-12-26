class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  # GET /games
  def index
    @ranking_table = Ranking.all
  end

  # POST /create
  def create
    @game = Game.new(params[:player1], params[:player2])
    persist_game
    redirect_to edit_game_path(0), :flash => { notice: 'Game has started!' }
  end

  # GET /games/new
  def new
  end

  # GET /games/:id/edit
  def edit
    if @game 
      @who_move = @game.who_move?
      @status = @game.status
      @turn_counter = @game.turn_counter
    else
      redirect_to games_path, :flash => { error: "No game on this session" }
    end
  end

  # PUT /games/:id
  def update
    if @game
      who_move = @game.who_move?
      move = @game.move
      if @game.winner?
        notice = "#{@game.winner.name} WON!, #{@game.winner.wall_health} wall points reamaining."
        redirect_to games_path, :flash => { notice: notice }
        session[:game] = nil
      else
        persist_game
        notice = "#{who_move}: has damage #{move} wall points to the opponent."
        redirect_to edit_game_path(0), :flash => { notice: notice }
      end
    else
      redirect_to games_path, :flash => { error: "No game on this session" }
    end
  end
  # - - - - - - -
  private
  def persist_game
    session[:game] = @game.to_yaml
  end

  def set_game
    if session[:game]
      @game = YAML.load(session[:game])
    else
      @game = nil
    end
  end
end
