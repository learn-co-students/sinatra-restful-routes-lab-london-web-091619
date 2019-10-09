class RecipesController < ApplicationController
  # new
  get "/recipes/new" do
    @recipe = Recipe.new
    erb :"/recipes/new"
  end

  # create
  post "/recipes/?" do
    attributes = {
      name: params[:name],
      ingredients: params[:ingredients],
      cook_time: params[:cook_time]
    }
    @recipe = Recipe.create(attributes)
    redirect "/recipes/#{@recipe.id}"
  end

  # index
  get "/recipes" do
    erb :"/recipes/index"
  end

  # show
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipes/show"
  end

  # edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipes/edit"
  end

  # update
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name])
    @recipe.update(ingredients: params[:ingredients])
    @recipe.update(cook_time: params[:cook_time])

    redirect "/recipes/#{@recipe.id}"
  end

  # destroy
  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect "/recipes"
  end
end
