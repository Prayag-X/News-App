import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:news_app/services/graphql_file.dart';
import 'package:news_app/services/model.dart';
import 'package:news_app/services/query.dart';
import 'package:news_app/ui_components/pages.dart';

void main() async {
  await initHiveForFlutter();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GraphqlClass graphqlClass = GraphqlClass();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlClass.client,
      child: MaterialApp(
        title: "News APP",
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool gotData = false;
  GraphqlClass graphqlClass = GraphqlClass();
  GetallNews getallNews = GetallNews([]);

  Future<void> getNews() async {
    GraphQLClient client = graphqlClass.clientToQuery();
    QueryResult result = await client.query(QueryOptions(
      document: gql(QueryNews().query),
      fetchPolicy: FetchPolicy.noCache,
    ));
    setState(() {
      getallNews = GetallNews.fromJson(result.data!);
      gotData = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return !gotData
        ? Loading()
        : NewsSet(getallNews: getallNews);
  }
}