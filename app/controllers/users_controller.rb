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

  def update
    @user = current_user

    @user.first_name = params["first_name"] || @user.first_name
    @user.last_name = params["last_name"] || @user.last_name
    @user.email = params["email"] || @user.email
    @user.username = params["username"] || @user.username
    @user.age = params["age"] || @user.age
    @user.status = params["status"] || @user.status

    if @user.save
      @user.save
      render json: {message: "Updated User!"}, updated_user: @user
    else 
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @user = current_user
    @user.status = "deactivated"
    @user.save
    render json: {message: "User has been successfully deactivated."}
  end



end
