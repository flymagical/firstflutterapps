import 'package:flutter/material.dart';
import 'package:flutter_apps/models/model_newsportal.dart';
import 'package:flutter_apps/screens/newsportalscreen.dart';

class UINewsPortal {
  Widget buildNewsList(List<Articles> articles) {
    return ListView.builder(
        //itemCount: articles.length,
        itemCount: articles?.length,
        itemBuilder: (context, index) {
          Articles articleData = articles[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetails(
                            articles: articleData,
                          )));
            },
            child: Card(
              elevation: 7,
              shadowColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          child: articleData.urlToImage != null
                              ? Image.network(
                                  articleData.urlToImage,
                                )
                              : Image.asset("images/news.jpg"),
                        ),
                      )),
                      Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                            color: Colors.blue[100],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(articleData?.title ?? "No Title",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito')),
                              ))),
                      Container(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Flexible(
                                  child: Text(articleData?.author ?? "No Author")),
                              Flexible(
                                  child: Text(
                                      articleData?.publishedAt?.substring(0, 10) ??
                                          ""))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildNewsDetail(Articles articles) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(25)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, right: 50),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        width: double.infinity,
                        child: Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 10, bottom: 10),
                            child: Text(
                              articles?.title ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily: 'Nunito'),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: articles?.urlToImage == null
                          ? Image.asset("images/news.jpg")
                          : Image.network(articles?.urlToImage),
                    ),
                  ),
                ],
              ),
            ),
            //Image.asset(modelFoods.image),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                articles?.content ?? "",
                style: TextStyle(fontFamily: 'Nunito', color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
