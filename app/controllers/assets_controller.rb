class AssetsController < ApplicationController

  def index
    @assets = Asset.all

      if params[:search]
        @assets = assets.where("name ILIKE ?", "%#{params[:search]}%")
      end
      # index action to allow for searching by name (using params “search”).

      if params[:sort] == "alphabetically"
        @assets = assets.order(created_at: :asc)
      end
      # index action to allow viewing alphabetically

      render template: "assets/index"
  end

  def show
    @asset = Asset.find_by(id: params[:id])

    render template: "assets/show"
  end

end
