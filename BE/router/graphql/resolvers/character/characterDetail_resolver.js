const axios = require('axios')
const { response } = require('express')

const characterDetail = {
    characterById: async () => {
        const endpoints = [
            'https://api.jikan.moe/v4/characters/17',
            'https://api.jikan.moe/v4/characters/17/anime',
            'https://api.jikan.moe/v4/characters/17/voices'
        ]
        const response_map = await Promise.all(endpoints.map((endpoint) => axios.get(endpoint))).then(
            axios.spread((character, anime, voice) => {
                return [character.data, anime.data, voice.data]
            })
        ).then((res) => {
            return {
                "character": res[0].data,
                "anime": res[1].data,
                "voices": res[2].data
            }
        })
        const appearence_list = []
        const voice_actor_list = []
        response_map.anime.forEach(element => {
            appearence_list.push({
                "role":element.role,
                "anime_id": element.anime.mal_id,
                "anime_title":element.anime.title
            })
            
        })
        response_map.voices.forEach(element => {
            voice_actor_list.push({
                "language":element.language,
                "actor_id": element.person.mal_id,
                "name":element.person.name
            })
            
        })
        
        response_map.character["appeareance"] = appearence_list
        response_map.character["voice_actor"] = voice_actor_list
        return response_map.character;

    }
}

module.exports = characterDetail