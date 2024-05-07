class UsersController < ApplicationController
  # before_action :authenticate_request, except: [:create]
  # before_action :authorize_admin, only: [:index, :show, :destroy]

 
  # create
  def create
    user = User.create(user_params)
    if user.save
      render json: UserBlueprint.render(user, view: :normal), status: :created
    else
      render json:  { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # read all
  def index
    users = User.all
    render json: UserBlueprint.render(users, view: :normal), status: 200
  end

  # read one
  def show
    user = User.find(params[:id])
    render json: UserBlueprint.render(user, view: :normal), status: 200
  end

  # update
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: UserBlueprint.render(user, view: :normal), status: 200
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # delete
  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { message: 'User deleted successfully'}, status: 200
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password, :password_confirmation, :user_type)
  end
end
