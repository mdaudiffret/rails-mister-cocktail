class CocktailsController < ApplicationController
  before_action :set_cocktail, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.picture_url = Unsplash::Photo.search(@cocktail.name)[0][:urls]['small']
    @cocktail.save
    redirect_to cocktails_path
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description)
  end
end
