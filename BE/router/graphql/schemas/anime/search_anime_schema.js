const searchAnime =
    ` 
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
        duration: String
        rating: String
        score: String
        rank: Int
        season: String
        images: Images
      }
      
    `
module.exports = searchAnime