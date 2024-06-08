class CountryFacade
  def self.get_country
    country = CountryService.call_db('')
    country.sample(1).first[:name][:common]
  end
end