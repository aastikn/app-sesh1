import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:quiz_app/Data/model.dart';

// ignore: camel_case_types
class answer extends StatefulWidget {
  final List<String> answers;
  const answer({super.key, required this.answers});
  @override
  State<answer> createState() => _answerState();
}

// ignore: camel_case_types
class _answerState extends State<answer> {
  List<model> questions = [];
  Color check = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    // Load JSON data from assets
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString('assets/questions.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<model> parsedQuestions =
        jsonList.map((json) => model.fromJson(json)).toList();
    setState(() {
      questions = parsedQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        body: Column(
          children: [
            Expanded(child: getList()),
            Container(
              child: LikeButton()
              )
          ],
        )
            
        );
  }
  getList(){
    return ListView.builder(
      shrinkWrap: true,
              itemCount: widget.answers.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Container(
                        height: 100.0,
                        padding: EdgeInsets.all(12.0),
                        child: ListTile(
                          tileColor: Colors.yellow,
                          selectedColor: Colors.yellowAccent,
                          onTap: () {
                            setState(() {
                              if (widget.answers[index].toString() ==
                                  questions[index].correctAnswer) {
                                check = Colors.green;
                              } else {
                                check = Colors.red;
                              }
                            });
                            return;
                          },
                          title: Text(
                            widget.answers[index].toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          contentPadding: const EdgeInsets.all(10.0),
                        )));
              },
            );
  }
}
