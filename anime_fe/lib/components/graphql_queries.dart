class GraphqlQuery {
  static String getAnimes(String anime_name) {
    return """
    query {
      animes(name:"$anime_name"){
        mal_id
        title_english
        type
        episodes
        score
        images{
          jpg{
            image_url
          }
        }
      }
    }
    """;
  }

  static String getCharcter(String character_name) {
    return """
    query {
      characters(name:"$character_name"){
        mal_id
        name
        favorites
        nicknames
        images{
          jpg{
            image_url
          }
        }
      }
    }
    """;
  }
}
