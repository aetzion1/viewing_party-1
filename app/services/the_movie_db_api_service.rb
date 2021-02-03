class TheMovieDbApiService 
    class << self
        def top_rated_movies
            response = conn.get("/3/discover/movie?sort_by=vote_average.desc")
            parse(response)
        end

        def find_by_title(arg)
            response = conn.get("/3/search/movie?language=en-US&query=#{arg}")
            results = parse(response)
        end

        def find_movie(id)
            response = conn.get("/3/movie/#{id}")
            response = parse(response)
        end

    private

    def parse(arg)
        JSON.parse(arg.body, symbolize_names: true)
    end

    def conn
        conn = Faraday.new("https://api.themoviedb.org") do |faraday|
            faraday.params['api_key'] = ENV['api_key']
        end
    end
  end
end