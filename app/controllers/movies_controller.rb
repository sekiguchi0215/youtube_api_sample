class MoviesController < ApplicationController
  require "dotenv/load"
  require "google/apis/youtube_v3"

  def find_videos(keyword)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = ENV["GOOGLE_API_KEY"]
    option = {
      q: keyword,
      type: "video",
      max_results: 10,
      order: :date,
    }
    youtube.list_searches(:id, :snippet, option)
  end

  def index
    @youtube_data = find_videos("ポケモンカード")
  end
end
