const axios = require('axios')

const AnimeDetail = {
    animeById: async ({id}) => {
        const endpoints = [
            `https://api.jikan.moe/v4/anime/${id}`,
            `https://api.jikan.moe/v4/anime/${id}/characters`,
            `https://api.jikan.moe/v4/anime/${id}/recommendations`
        ]
        const response_map = await Promise.all(endpoints.map((endpoint) => axios.get(endpoint))).then(
            axios.spread((anime, characters, recommendations) => {
                return [anime.data, characters.data, recommendations.data]
            })
        ).then((res) => {
            return {
                "anime": res[0].data,
                "characters": res[1].data,
                "recommendations": res[2].data
            }
        })
        const characters_list = []
        const recommendations_list = []
        response_map.characters.forEach(element => {
            characters_list.push({
                "character_id":element.character.mal_id,
                "name": element.character.name,
                "role":element.role
            })
            
        })
        response_map.recommendations.forEach(element => {
            recommendations_list.push({
                "anime_id":element.entry.mal_id,
                "title": element.entry.title,
                "votes":element.votes
            })
            
        })

        response_map.anime["anime_characters"] = characters_list
        response_map.anime["recommendations"] = recommendations_list
        
        return response_map.anime;

    }
}

module.exports = AnimeDetail