class Country
  attr_reader :name,
              :lat,
              :lon
  
  def initialize(data)
    @name = data[:name][:common]
    @lat  = data[:latlng][0]
    @lon  = data[:latlng][1]
  end
end