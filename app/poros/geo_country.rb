class GeoCountry 
  attr_reader :lat,
              :lon
  
  def initialize(data)
    # require 'pry'; binding.pry
    @lat = data[:properties][:lon]
    @lon = data[:properties][:lat]
  end
end