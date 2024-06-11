class GeoCountriesFacade
  def self.find_country(country)
    params = { text: "country=#{country}" }
    search = GeoCountriesService.call_db('/v1/geocode/search', params)[:features]
    search.map { |s| GeoCountry.new(s) }
  end
end