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
// Images type is present in search character and as all the schema are merged, so there is no need to make duplicate schema
module.exports = characterDetail