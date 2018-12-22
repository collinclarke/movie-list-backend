class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])    
  end

  def create
    @user = User.new(user_params[:username])
    @user.password = user_params[:password]

    if @user.save
      give_token
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def give_token
      jwt = Auth.issue({user: @user.id})
      render json: {jwt: jwt}
    end

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
