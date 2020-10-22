import 'package:flutter/material.dart';
import 'package:flutter_apps/models/modelquiz.dart';
import 'package:flutter_apps/networks/network.dart';

class Quiz extends StatefulWidget {
  static final String screenId = "quiz";
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Network network = Network();

  //Result is from ModelQuiz
  List<Result> result;

  //Future<List<Result>> 
  getQuizData() async {
    network.getQuizData().then((response) {
      result = response.results;
      return result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz",
          style: TextStyle(fontFamily: "Nunito"),
        ),
      ),
      body: FutureBuilder(future: getQuizData(), builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(child: Text("No data found"));
            break;

          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;

          case ConnectionState.done:
            if (snapshot.hasError) {
              return errorData(snapshot);
            } else {
              return getQuizList();
            }
            break;

          case ConnectionState.active:
            break;
        }
      }),
    );
  }

  errorData(AsyncSnapshot snapshot) {
    print("error information: " + snapshot.error);
  }

  Widget getQuizList() {
    return ListView.builder(itemBuilder: (context, index){
      Result quizResult = result[index] ?? null;
      return Card(
        elevation: 7,
        shadowColor: Colors.blue,
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                              color: Colors.blue[100],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                //color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    quizResult.question, 
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Nunito", color: Colors.black),
                  ),
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    FilterChip(disabledColor: Colors.green[100], backgroundColor: Colors.grey[50], label: Text(quizResult.category), onSelected: null,),
                    SizedBox(width:10),
                    FilterChip(disabledColor: Colors.pink[100], label: Text(quizResult.difficulty), onSelected: null, backgroundColor: Colors.grey[50],)
                  ],
                ),
              )
            ],
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Text(quizResult.type.startsWith("m") ? "M" : "B"),
          ),
          children: quizResult.incorrectAnswers.map((e) => AnswerList(quizResult, index, e)).toList(),
        ),
      );
    },
    itemCount: result?.length ?? 0,
    );
  }
}

class AnswerList extends StatefulWidget {
  Result result;
  int index;
  String e;
  AnswerList(this.result, this.index, this.e);
  @override
  _AnswerListState createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList> {
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      title: Center(
        child: Text(
          widget.e, 
          style: TextStyle(
            color: color, 
            fontWeight: FontWeight.bold, 
            fontFamily: "Nunito")
          ),
      ),
    );
  }
}
