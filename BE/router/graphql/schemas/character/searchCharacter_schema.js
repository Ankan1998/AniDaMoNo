const characterSearch = 
    ` 
      type Jpg {
        image_url: String
      }
      
      type Images {
        jpg: Jpg
      }
      
      type Character {
        mal_id: Int
        name: String
        favorites: Int
        about: String
        nicknames: [String]
        images: Images
      }
    `


module.exports = characterSearch;

  