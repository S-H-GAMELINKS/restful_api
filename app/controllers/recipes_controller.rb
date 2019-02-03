class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
    render json: "{\"recipes\": #{@recipes.to_json} }"
  end

  # GET /recipes/1
  def show
    render json: "{ \"message\": \"Recipe details by id\", \"recipe\": #{@recipe.to_json} }"
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: "{ \"message\": \"Recipe successfully created!\", \"recipe\": #{@recipe.to_json} }"
    else
      render json: "{ \"message\": \"Recipe creation failed!\", \"required\": \"title, making_time, serves, ingredients, cost\" }"
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: "{ \"message\": \"Recipe successfully updated!\", \"recipe\": #{@recipe.to_json} }"
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    if @recipe != nil
      @recipe.destroy
      response = {"message" => "Recipe successfully removed!"}
      render json: response
    else
      response = {"message" => "No Recipe found"}
      render json: response
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:title, :making_time, :serves, :ingredients, :cost)
    end
end
