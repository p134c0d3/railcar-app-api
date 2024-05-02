class UsersController < ApplicationController
  # before_action :authenticate_request, except: [:create]

 
  # create
  def create
    user = User.create(user_params)
    if user.save
      render json: user, status: :created
    else
      render json:  { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # read
  def index
    users = User.all
    render json: users, status: 200
  end

  # update
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # delete
  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { message: 'User deleted successfully'} status: 200
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
