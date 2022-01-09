const characterDetail = 
    `
    type VoiceActor {
        language: String
        actor_id: Int
        name: String
    }
    
    type Appeareance {
        role: String
        anime_id: Int
        anime_title: String
    }
    
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
    
    type CharacterDetail {
        mal_id: Int
        url: String
        name: String
        favorites: Int
        about: String
        voice_actor: [VoiceActor]
        appeareance: [Appeareance]
        nicknames: [String]
        images: Images
    }
    
    `

module.exports = characterDetail