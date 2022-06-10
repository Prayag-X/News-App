import 'package:flutter/material.dart';
import 'package:news_app/services/model.dart';
import 'package:url_launcher/url_launcher.dart';

class News_Card extends StatelessWidget {
  final News? news;
  const News_Card({Key? key, this.news}) : super(key: key);

  void _launchUrl(url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  Widget fullNews(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        snap: false,
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 0.9,
        controller: DraggableScrollableController(),
        builder: (_, controller) =>
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                colors: [Colors.red, Color(0xFF151515)],
                stops: [0,0.2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                ),
                // border: Border.all(width: 1.0, color: Color(0xFF000000)),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: ListView(
                controller: controller,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {Navigator.of(context).pop();},
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        const Center(
                          child: Text(
                              "Or drag down to close",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          image: DecorationImage(
                            image: NetworkImage(
                                news!.urlToImage!),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        news!.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        news!.description!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        news!.source!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        news!.author!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        news!.publishedAt!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                      onPressed: () => _launchUrl(news!.url!),
                      child: const Text(
                          "Read More",
                      )
                    ),
                  ],
                ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => fullNews(context)),
      child: Container(
        color: const Color(0xFF181818),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(width: 1.0, color: const Color(0xFF181818)),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                        news!.urlToImage!),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(height: 10),
            Container(
              width: 350,
              child: Text(
                news!.title!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news!.source!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    news!.publishedAt!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 350,
              child: const Divider(
                height: 1.0,
                color: Colors.white,
                thickness: 0.2,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
