const axios = require('axios')

const characterDetail = {
    characterById: async () => {
        const endpoints = [
            'https://api.jikan.moe/v4/characters/17',
            'https://api.jikan.moe/v4/characters/17/anime',
            'https://api.jikan.moe/v4/characters/17/voices'
        ]
        await axios.all(endpoints.map((endpoint) => axios.get(endpoint))).then(
            axios.spread((a, b, c) => {
                return [a.data, b.data, c.data]
            })
        ).then((res) => console.log({
            "a": res[0].data,
            "b": res[1].data,
            "c": res[2].data
        }))
        return 0;

    }
}

module.exports = characterDetail