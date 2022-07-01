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

end





