class GeoCountry 
  attr_reader :lat,
              :lon
  
  def initialize(data)
    @lat = data[:properties][:lon]
    @lon = data[:properties][:lat]
  end
end