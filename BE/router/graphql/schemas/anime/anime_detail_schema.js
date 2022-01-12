const animeDetail = 
    `type Recommendations {
        anime_id: Int
        title: String
        votes: Int
      }
      
      type AnimeCharacters {
        character_id: Int
        name: String
        role: String
      }
      
      type CombinedQuery {
        mal_id: Int
        type: String
        name: String
        url: String
      }
      
      type Broadcast {
        day: String
        time: String
        timezone: String
        string: String
      }
      
      type To_From {
        day: Int
        month: Int
        year: Int
      }
      
      type Prop {
        to: To_From
        from: To_From
      }
      
      type Aired {
        from: String
        to: String
        string: String
        prop: Prop
      }
      
      type Trailer_Images {
        image_url: String
        small_image_url: String
        medium_image_url: String
        large_image_url: String
        maximum_image_url: String
      }
      
      type Trailer {
        youtube_id: String
        url: String
        embed_url: String
        images: Trailer_Images
      }
      
      type AnimeDetail {
        mal_id: Int
        url: String
        title: String
        title_english: String
        title_japanese: String
        type: String
        source: String
        episodes: String
        status: String
        airing: Boolean
        duration: String
        rating: String
        score: Float
        scored_by: Int
        rank: Int
        popularity: Int
        members: Int
        favorites: Int
        synopsis: String
        background: String
        season: String
        year: Int
        recommendations: [Recommendations]
        anime_characters: [AnimeCharacters]
        demographics: [CombinedQuery]
        themes: [CombinedQuery]
        explicit_genres: [String]
        genres: [CombinedQuery]
        studios: [CombinedQuery]
        licensors: [CombinedQuery]
        producers: [CombinedQuery]
        broadcast: Broadcast
        aired: Aired
        trailer: Trailer
        images: Images
      }
      
    `

module.exports = animeDetail