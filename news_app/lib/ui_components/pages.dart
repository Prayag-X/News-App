import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/services/model.dart';
import 'package:news_app/ui_components/news_card.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color(0xFF282828),
          title: const Center(
            child: Text(
              "NEWS APP",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

class NewsSet extends StatelessWidget {
  const NewsSet({
    Key? key,
    required this.getallNews,
  }) : super(key: key);

  final GetallNews getallNews;

  @override
  Widget build(BuildContext context) {
    return getallNews.news.isNotEmpty
        ? newsPresent(getallNews: getallNews)
        : const newsAbsent();
  }
}

class newsAbsent extends StatelessWidget {
  const newsAbsent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF181818),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFF282828),
            title: const Center(
              child: Text(
                "NEWS APP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
        body: const Center(
          child: Text(
            "No News",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ));
  }
}

class newsPresent extends StatelessWidget {
  const newsPresent({
    Key? key,
    required this.getallNews,
  }) : super(key: key);

  final GetallNews getallNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color(0xFF282828),
          title: const Center(
            child: Text(
              "NEWS APP",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF181818),
              height: 20.0,
            ),
            Column(
              children:
                  getallNews.news.map((news) => News_Card(news: news)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
