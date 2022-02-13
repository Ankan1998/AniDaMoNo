class GraphqlQuery {
  static String getAnimes(String anime_name) {
    return """
    query {
      animes(name:"$anime_name"){
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
}
