class UsersController < ApplicationController


  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      username: params[:username],
      age: params[:age],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end


  def show
    @user = current_user
    if @user.save
      render template: "users/show"
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @user = current_user
    @.status = "removed"
    carted_product.save
    render json: {message: "Carted Product has been successfully removed."}
  end



end
