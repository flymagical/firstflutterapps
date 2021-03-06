import 'package:flutter/material.dart';
import 'package:flutter_apps/models/model_newsportal.dart';
import 'package:flutter_apps/networks/network.dart';
import 'package:flutter_apps/screens/ui/ui_newportal.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:toast/toast.dart';

class NewsPortalScreen extends StatefulWidget {
  static final String screenId = "news";
  @override
  _NewsPortalScreenState createState() => _NewsPortalScreenState();
}

class _NewsPortalScreenState extends State<NewsPortalScreen> {
  bool loading;
  List<Articles> articles;
  Network networkNewsPortal = Network();
  UINewsPortal uiNewsPortal = UINewsPortal();
  @override
  void initState(){
    getNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Portal"),),
      body: 
        loading == true ? 
          Center(child: CircularProgressIndicator(),) 
        : 
          uiNewsPortal.buildNewsList(articles),
    );
  }

  void getNewsData(){
    loading = true;
    networkNewsPortal.getNewsData().then((responses){
      print("Sampe sini bener!!!!");
      if(responses.status == "ok"){
        var articleData = responses.articles;
        print("status: "+responses.status);
        setState((){
          loading = false;
          articles = articleData;
        });
        Toast.show("Data is found", context);
      }else{
        setState((){
          loading = false;
        });
        Toast.show("Data is not found", context);
      }
    });
  }
}

class NewsDetails extends StatelessWidget {
  static final String screenId = "newsDetail";
  final UINewsPortal uiNewsPortal = UINewsPortal();
  final Articles articles;

  NewsDetails({Key key, @required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Details", 
          style: TextStyle(
            fontFamily: 'Nunito'
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.open_in_browser
            ), onPressed: (){
              // Navigator.push(
              //   context, 
              //   MaterialPageRoute(
              //     builder: (context) => WebViewNewsPortal(articles: articles,)));

              Navigator.pushNamed(context, WebViewNewsPortal.screenId, arguments: articles);
            },
          )
        ],
      ),
      body: uiNewsPortal.buildNewsDetail(articles)
    );
  }
}

class WebViewNewsPortal extends StatelessWidget {
  static final String screenId = "webViewNews";
  final Articles articles;

  WebViewNewsPortal({Key key, @required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(articles.title),
      ),
      url: articles?.url,
    );
  }
}