class GamesController < ApplicationController
  before_action :load_game, only: %i[show]

  def index
    @games = Game.select('id, name, email, created_at').limit(10)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.js
      else
        format.html { flash[:alert] = @game.errors.full_messages.to_sentence }
        format.js
      end
    end
  end

  def show; end

  def all_boards
    @games = Game.select('id, name, email, created_at')
  end

  private

  def game_params
    params.require(:game).permit(:name, :width, :height, :email, :number_of_mines)
  end

  def load_game
    @game = Game.find_by_id(params[:id])
    return if @game.present?

    flash[:alert] = "Game doesn't exists."
    redirect_to games_path
  end
end
