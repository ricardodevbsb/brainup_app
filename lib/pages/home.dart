import 'package:brainup_app/Admin/admin_login.dart';
import 'package:brainup_app/pages/question.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFF10abc4),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/images/perfil.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text('Ricardo Fernandes',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => AdminLogin())));
                },
                child: Text("Admin"),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 40, color: Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Color(0xFFf58c24),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.only(left: 30.0, top: 30.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFf58c24),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 3, 3),
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                  child: Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        child: Image.asset(
                          "assets/images/brain.png",
                          height: 130,
                          width: 150,
                        )),
                    SizedBox(width: 10),
                    Text(
                      '  Teste seus\nconhecimentos',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff10abc4),
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                )
              ]),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Categorias",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 2, 2, 2))),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(
                                  category: "Geografia",
                                ),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 2, 2, 2),
                                          blurRadius: 8,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/geo.png",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("Geografia")
                                  ],
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(
                                  category: "Brasil",
                                ),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 2, 2, 2),
                                          blurRadius: 8,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/bra.png",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("Português")
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(
                                  category: "Inglês",
                                ),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 5, 5, 5),
                                          blurRadius: 8,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/en.png",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("Inglês")
                                  ],
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(
                                  category: "História",
                                ),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 7, 7, 7),
                                          blurRadius: 8,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/ev.png",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("História")
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(
                                  category: "Matemática",
                                ),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 5, 5, 5),
                                          blurRadius: 8,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/mathmatics.png",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("Matemática")
                                  ],
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(
                                  category: "Ciências",
                                ),
                              ),
                            );
                          },
                          child: Material(
                            child: Container(
                                height: 120,
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(255, 7, 7, 7),
                                          blurRadius: 8,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/chemistry.png",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("Ciências")
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
