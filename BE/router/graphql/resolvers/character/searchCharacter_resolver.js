const axios = require('axios')

const characterSearch = {
    characters: async()=>{
        const url = "https://api.jikan.moe/v4/characters?q=levi"
        return await axios.get(url).then((response)=>response.data).then((data)=>{
            return data.data
        })
    }
}

module.exports = characterSearch;