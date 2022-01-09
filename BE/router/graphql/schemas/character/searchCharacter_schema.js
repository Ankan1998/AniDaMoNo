const characterSearch = 
    `
    type Webp {
        image_url: String
        small_image_url: String
      }
      
      type Jpg {
        image_url: String
      }
      
      type Images {
        webp: Webp
        jpg: Jpg
      }
      
      type Character {
        mal_id: Int
        url: String
        name: String
        favorites: Int
        about: String
        nicknames: [String]
        images: Images
      }
    `


module.exports = characterSearch;

  