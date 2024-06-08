class EdamamService					
  def self.call_db(url, params = {})		
    response = connection.get(url) do |request| 		
      request.params = params		
      request.params[:app_key] = Rails.application.credentials.edamam[:key]		
      request.params[:app_id] = Rails.application.credentials.edamam[:id]		
    end		
    JSON.parse(response.body, symbolize_names: true)		
  end		
      
  private		
      
  def self.connection		
    Faraday.new('https://api.edamam.com')		
  end
end

