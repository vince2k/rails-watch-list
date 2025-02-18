require 'uri'
require 'net/http'

class TmdbLewagonService
  def self.top_rated_movies
    url = URI("https://tmdb.lewagon.com/movie/top_rated")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = 'application/json'

        response = http.request(request)
        @auth_response = JSON.parse(response.body)
  end
end
