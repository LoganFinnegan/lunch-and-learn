class CountryFacade
  def self.get_country
    country = CountryService.call_db('').shuffle[0]
    Country.new(country)
  end
end