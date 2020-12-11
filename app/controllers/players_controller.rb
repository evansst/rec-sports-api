class PlayersController < ApplicationController
  before_action :authenticate, only: [:show, :update, :destroy]

  # GET /players
  def index
    @players = Player.all

    render json: { players: @players }
  end

  # GET /players/1
  def show
    render json: { player: @player, teams: @player.teams }
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      token = JWT.encode(
        { user_id: @player.id },
        'some special secret string'
      )
      render json: { player: @player, token: token }, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:name, :username, :password, :email_address, :gender)
    end
end
