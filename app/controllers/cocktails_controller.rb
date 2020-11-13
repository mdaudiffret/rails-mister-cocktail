class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update]

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
    if Unsplash::Photo.search(@cocktail.name).empty?
      @cocktail.picture_url = Unsplash::Photo.search("dinosaure")[0][:urls]['small']
    else
      @cocktail.picture_url = Unsplash::Photo.search(@cocktail.name)[0][:urls]['small']
    end
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail.save
    raise
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end
end
