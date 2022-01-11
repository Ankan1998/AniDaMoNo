const searchAnime =
    `type Genre_Studio_Producer {
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
      
      type Animes {
        mal_id: Int
        url: String
        title: String
        title_english: String
        title_japanese: String
        type: String
        source: String
        episodes: Int
        status: String
        airing: Boolean
        duration: String
        rating: String
        score: String
        scored_by: String
        rank: Int
        popularity: Int
        members: Int
        favorites: Int
        synopsis: String
        background: String
        season: String
        year: Int
        demographics: [String]
        themes: [String]
        explicit_genres: [String]
        genres: [Genre_Studio_Producer]
        studios: [Genre_Studio_Producer]
        producers: [Genre_Studio_Producer]
        broadcast: Broadcast
        aired: Aired
        title_synonyms: [String]
        trailer: Trailer
        images: Images
      }
      
    `
module.exports = searchAnime