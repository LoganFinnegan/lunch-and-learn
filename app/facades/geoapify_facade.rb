class GeoapifyFacade 
  def self.search_for(location)
    params = { categories: "tourism.attraction",
    bias: "proximity:-#{location.lat},#{location.lon}",
    limit: 10
  }
  result = GeoapifyService.call_db('/v2/places', params)[:features]
  result.map { |r| Geoapify.new(r[:properties]) }
  end
end