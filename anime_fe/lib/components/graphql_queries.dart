class GraphqlQuery {
  static String getAnimes(String anime_name) {
    return """
    query {
      animes(name:"Naruto"){
        title_english
        type
        episodes
      }
    }
    """;
  }
}
