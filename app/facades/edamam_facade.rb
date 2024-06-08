class EdamamFacade
  def self.search_recipes(country)
    params = { q: country, type: "any" }
    recipes = EdamamService.call_db("/api/recipes/v2", params)[:hits]
    recipes.map { |r| Recipe.new(r[:recipe], country) }
  end
end