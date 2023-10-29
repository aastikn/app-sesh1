import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:quiz_app/Data/model.dart';
import 'package:quiz_app/Widget/shapechip.dart';

class questionr extends StatefulWidget {
  const questionr({super.key});

  @override
  State<questionr> createState() => _questionrState();
}

// ignore: camel_case_types
class _questionrState extends State<questionr> {
  late Future<List<model>> _questionsFuture;
  List<model> questions = [];

  @override
  void initState() {
    super.initState();
    _questionsFuture = _loadQuestions();
    getQuestions();
  }

  Future<void> getQuestions() async {
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

  Future<List<model>> _loadQuestions() async {
    // Load JSON data from assets
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString('assets/questions.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<model> parsedQuestions =
        jsonList.map((json) => model.fromJson(json)).toList();
    return parsedQuestions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          "My Quiz App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _loadQuestions(),
        builder: (BuildContext context, AsyncSnapshot<List<model>> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                child: CircularProgressIndicator(),
                );
              } else if(snapshot.hasData){
                return questionsss(questions);
              }
              else {
            return const Center(
              child: Text('Unknown error occurred.'),
            );
          }
        }
      )
    );
  }



   ListView questionsss(List<model> questions){
      return ListView.builder(
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child:Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Row(children: [
                    Text(
                    questions[index].question.toString(),
                    style: const TextStyle(
                        color: Colors.black,fontSize: 15.0),
                  ),
                  IconButton(
                      icon: const Icon(Icons.arrow_right, color: Colors.black,size: 30.0,),
                      onPressed: () {
                        List<String>? answers = questions[index].options;
                        Navigator.pushNamed(context, '/answer', arguments: answers);
                      }),
                  ],),
                  Align(
                    alignment: Alignment.bottomLeft,
                  child: FittedBox(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        shapeChip(
                          Label: questions[index].Topic.toString(), 
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        shapeChip(
                          Label: questions[index].difficulty.toString(),
                        ),
                      ],
                  ),
                  ),
                  )
                ],
              ),
            ),);
          });
      }
}


      
      
      
      
      
      
     