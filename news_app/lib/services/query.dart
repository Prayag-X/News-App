class QueryNews {
  String query = """
    query getNews {
      news {
        title
        url
        publishedAt
        author
        content
        description
        h_id
        source
        urlToImage
      }
    }
   """;
}