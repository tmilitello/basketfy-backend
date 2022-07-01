class AssetBasketsController < ApplicationController

  def index
    @asset_baskets = AssetBasket.all

      if params[:search]
        @asset_baskets = asset_baskets.where("name ILIKE ?", "%#{params[:search]}%")
      end
      # index action to allow for searching by name (using params “search”).

      if params[:sort] == "age"
        @asset_baskets = asset_baskets.order(created_at: :asc)
      end
      # index action to allow viewing alphabetically

      render template: "asset_baskets/index"
  end




end
