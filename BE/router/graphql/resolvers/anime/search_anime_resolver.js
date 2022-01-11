const axios = require('axios')

const animeSearchResolver = {
    animes: async({name})=>{
        const url = `https://api.jikan.moe/v4/anime?q=${name}`
        return await axios.get(url).then((response)=>response.data).then((data)=>{
            return data.data
        })
    }
}

module.exports = animeSearchResolver;