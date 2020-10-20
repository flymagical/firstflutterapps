import 'package:flutter/material.dart';
import 'package:flutter_apps/models/model_newsportal.dart';
import 'package:flutter_apps/networks/network_newsportal.dart';
import 'package:flutter_apps/screens/ui/ui_newportal.dart';
import 'package:toast/toast.dart';

class NewsPortalScreen extends StatefulWidget {
  @override
  _NewsPortalScreenState createState() => _NewsPortalScreenState();
}

class _NewsPortalScreenState extends State<NewsPortalScreen> {
  bool loading;
  List<Articles> articles;
  NetworkNewsPortal networkNewsPortal = NetworkNewsPortal();
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
      body: loading == true ? Center(child: CircularProgressIndicator(),) : uiNewsPortal.buildNewsList(articles),
    );
  }

  void getNewsData(){
    loading = true;
    networkNewsPortal.getNewsData().then((responses){
      if(responses.status == "ok"){
        var articleData = responses.articles;
        print("status: "+responses.status);
        setState((){
          loading = false;
          articles = articleData;
        });
        Toast.show("Data is found", context);
      }else{
        Toast.show("Data is not found", context);
      }
    });
  }
}

class NewsDetails extends StatelessWidget {
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
              //     builder: (context) => WebViewFoods(modelFoods: modelFoods)));
            },
          )
        ],
      ),
      body: uiNewsPortal.buildNewsDetail(articles)
    );
  }
}