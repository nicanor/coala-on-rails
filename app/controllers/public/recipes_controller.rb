class Public::RecipesController < Public::PublicController

  def index
    @recipes = public_recipes
  end

  def show
    @recipe = public_recipes
      .find_by(slug: params[:id])
  end

end