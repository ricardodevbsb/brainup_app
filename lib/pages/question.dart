import 'package:brainup_app/service/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question extends StatefulWidget {
  final String category;
  Question({required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int score = 0;

  bool show = false;
  getontheload() async {
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? QuizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    return StreamBuilder(
        stream: QuizStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? PageView.builder(
                  controller: controller,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 40),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      ds["Image"],
                                      height: 200,
                                      width: 300,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  ds["question"],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  if (ds["correct"] == ds["option1"]) {
                                    score++;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Parabéns'),
                                            content: Text('Você acertou a resposta'),
                                            
                                          );
                                        });
                                  }
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: ds["correct"] == ds["option1"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            border: Border.all(
                                              width: 1.5,
                                              color:
                                                  ds["correct"] == ds["option1"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option1"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.5,
                                              color: Color(0xFF818181),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option1"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  if (ds["correct"] == ds["option2"]) {
                                    score++;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Parabéns'),
                                            content: Text('Você acertou a resposta'),
                                            
                                          );
                                        });
                                  }
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: ds["correct"] == ds["option2"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            border: Border.all(
                                              width: 1.5,
                                              color:
                                                  ds["correct"] == ds["option2"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option2"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.5,
                                              color: Color(0xFF818181),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option2"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  if (ds["correct"] == ds["option3"]) {
                                    score++;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Parabéns'),
                                            content: Text('Você acertou a resposta'),
                                            
                                          );
                                        });
                                  }
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: ds["correct"] == ds["option3"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            border: Border.all(
                                              width: 1.5,
                                              color:
                                                  ds["correct"] == ds["option3"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option3"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.5,
                                              color: Color(0xFF818181),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option3"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  if (ds["correct"] == ds["option4"]) {
                                    score++;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Parabéns'),
                                            content: Text('Você acertou a resposta'),
                                            
                                          );
                                        });
                                  }
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: ds["correct"] == ds["option4"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            border: Border.all(
                                              width: 1.5,
                                              color:
                                                  ds["correct"] == ds["option4"]
                                                      ? Colors.green
                                                      : Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option4"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.5,
                                              color: Color(0xFF818181),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          ds["option4"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                              ),
                              SizedBox(height: 5.0),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = false;
                                  });
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Icon(Icons.arrow_forward_outlined,
                                          color: Color(0xFF004840)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004840),
      body: Container(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF35B32),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  widget.category,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Score: $score",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: allQuiz())
        ]),
      ),
    );
  }
}
