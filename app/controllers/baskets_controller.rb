class BasketsController < ApplicationController

  def index
    @baskets = Basket.all

      if params[:search]
        @baskets = baskets.where("name ILIKE ?", "%#{params[:search]}%")
      end
      # # index action to allow for searching by name (using params “search”).
      if params[:sort] == "age"
        @baskets = baskets.order(created_at: :asc)
      end
      # index action to allow the user to see products in order of age, newest to older (when params “sort” is equal to “age”)

      render template: "baskets/index"
  end


  def show
    @basket = Basket.find_by(id: params[:id])
    if @basket.save
      render template: "baskets/show"
    else
      render json: { errors: @basket.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @basket = Basket.find_by(id: params[:id])

    @basket.name = params["name"] || @basket.name
    @basket.status = params["status"] || @basket.status

  

    if @basket.save
      @basket.save
      render json: {message: "Updated basket!"}, updated_basket: @basket
    else 
      render json: {errors: @basket.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @basket = Basket.find_by(id: params[:id])
    @basket.status = "deactivated"
    @basket.save
    render json: {message: "Basket has been successfully deactivated."}
  end
end





