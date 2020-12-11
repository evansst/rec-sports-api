class AuthenticationController < ApplicationController
  def login
    @player = Player.find_by(username: params[:username])


    if !@player || !@player.authenticate(params[:password])
      render json: { message: 'Something is wrong with your Username or Password' }, status: :unauthorized
    else
      token = encode_token(@player)

      render json: { player: @player, token: token }, status: :ok
    end
  end

  def encode_token(player)
    JWT.encode(
      { user_id: player.id },
      'some special secret string'
    )
  end
end
