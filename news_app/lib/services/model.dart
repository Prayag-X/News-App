class GetallNews {
  List <News> news = <News>[];

  GetallNews(this.news);

  GetallNews.fromJson(Map<String, dynamic> json){
    if(json['news']!=null)
      {
        json['news'].forEach((data){
          news.add(News.fromJson(data));
        });
      }
  }
}

class News {
  String? title;
  String? url;
  String? publishedAt;
  String? author;
  String? content;
  String? description;
  int? h_id;
  String? source;
  String? urlToImage;

  News(this.title,this.url,this.publishedAt,this.author,this.content,this.description,this.h_id,this.source,this.urlToImage);

  News.fromJson(Map<String, dynamic> json){
    title = json['title'];
    url = json['url'];
    publishedAt = json['publishedAt'];
    author = json['author'];
    content = json['content'];
    description = json['description'];
    h_id = json['h_id'];
    source = json['source'];
    urlToImage = json['urlToImage'];
  }
}