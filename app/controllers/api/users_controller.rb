class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :user,:except=>[:index]
  def index
    if params[:term].present?
      users = User.search(params[:term])
      if users.length == 0
        render json: {message: "No matched results found"}
      else
        render json: users, status: 200
      end
    else
      users = User.all
      render json: users, status: 200
    end
  end

  def show
    if user.present?
      render json: user, status: 200
    else
      render json: {error: "User not found"}
    end
  end

  def create
    user = User.find_by(id:params[:id])
    # binding.pry
    if user.present?
      render json: {message: "User already registered with this id"}
    else
      user = User.new(user_params)
      if user.save
        render json: user, status: 200 
      else
        render json: {error: user.errors}
      end
    end
  end

  def edit
  end

  def update
    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { error: "Unable to update user"}
    end
  end

  def destroy
    if user.destroy
      render json: {message: "User successfully deleted"}
    else
      render json: {error: "Unable to delete user"}
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstname,:lastname,:email)
  end
  def user
    user = User.find_by(id:params[:id])
  end
end
