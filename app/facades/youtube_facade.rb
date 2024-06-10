class YoutubeFacade 
  def self.search_youtube(country)
    params = { part: "snippet", channelId: "UCluQ5yInbeAkkeCndNnUhpw", q: country }
    result = YoutubeService.call_db('/youtube/v3/search', params)[:items].first
    if !result.nil? 
     { title: result[:snippet][:title], youtube_video_id: result[:id][:videoId] }
    else
      {}
    end
  end
end