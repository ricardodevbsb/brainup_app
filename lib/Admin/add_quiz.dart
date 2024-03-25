import 'dart:io';
import 'package:brainup_app/service/database.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({Key? key}) : super(key: key);

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        questioncontroller.text != "" &&
        option1controller.text != "" &&
        option2controller.text != "" &&
        option3controller.text != "" &&
        option4controller.text != "") {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImage").child(addId);

      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addQuiz = {
        "Image": downloadUrl,
        "question": questioncontroller.text,
        "option1": option1controller.text,
        "option2": option2controller.text,
        "option3": option3controller.text,
        "option4": option4controller.text,
        "correct": correctanswercontroller.text,
      };
      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("Adicionado com sucesso")));
      });
    }
  }

  String? value;
  final List<String> quizitems = ['Português', 'Geografia', 'Inglês', 'Matemática', 'História', 'Ciências'];
  TextEditingController questioncontroller = new TextEditingController();
  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController correctanswercontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        title: Text(
          "Adicionar Pergunta",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "upload a imagem",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                height: 20,
              ),
              Text(
                "Pergunta",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(decorationThickness: 0.0),
                  controller: questioncontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Escreva a pergunta",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 18,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Opção 1",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(decorationThickness: 0.0),
                  controller: option1controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Escreva opção 1",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 18,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Opção 2",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(decorationThickness: 0.0),
                  controller: option2controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Escreva opção 2",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 18,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Opção 3",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(decorationThickness: 0.0),
                  controller: option3controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Escreva opção 3",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 18,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Opção 4",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(decorationThickness: 0.0),
                  controller: option4controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Escreva opção 4",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 18,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Resposta",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(decorationThickness: 0.0),
                  controller: correctanswercontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "resposta",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 18,
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: quizitems
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: ((value) => setState(() {
                          this.value = value;
                        })),
                    dropdownColor: Colors.white,
                    hint: Text("Selecione a opção"),
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
