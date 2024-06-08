class CountryService					
  def self.call_db(url, params = {})		
    response = connection.get(url) do |request| 		
      request.params = params		
    end		
    JSON.parse(response.body, symbolize_names: true)		
  end		
      
  private		
      
  def self.connection		
    Faraday.new('https://restcountries.com/v3.1/all')		
  end
end

