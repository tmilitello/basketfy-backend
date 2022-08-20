class BasketsController < ApplicationController

  def create
    @basket = Basket.new(
      name: params[:name],
      user_id: current_user.id,
      status: "active",
      price: "100"
    )
    if @basket.save!
      params[:assets].each do |asset|
        AssetBasket.create!(
            basket_id: @basket.id,
            asset_id: asset[:asset_id],
            initial_weight: asset[:intial_weight].to_f * 0.01,
            status: "active"
           )
      end

      render template: "baskets/show", status: :created
    else
      render json: { errors: @basket.errors.full_messages }, status: :bad_request
    end
  end

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
    @basket.user_id = params['user_id'] || @basket.user_id
    @basket.status = params["status"] || @basket.status
    @basket.price = params["price"] || @basket.price
  

    if @basket.save!
      params[:assets].each do |asset|
        AssetBasket.create!(
            basket_id: @basket.id,
            asset_id: asset[:asset_id],
            initial_weight: asset[:initial_weight].to_f * 0.01,
            status: "active"
           )
      end
      render template: "baskets/show"
    else 
      render json: {errors: @basket.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @basket = Basket.find_by(id: params[:id])
    @basket.status = "inactive"
    @basket.save
    render json: {message: "Basket has been successfully deactivated."}
  end
end





