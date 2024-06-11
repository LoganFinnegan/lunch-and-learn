class UnsplashFacade
  def self.search_image(country, video)
    params = { query: country }
    result = UnsplashService.call_db('/search/photos', params)[:results]
    if result != nil
      images = result.map { |r| { alt_tag: r[:alternative_slugs][:en], url: r[:urls][:raw] }}
    else
      images = []  
    end
    LearningResource.new(video, images, country)
  end
end