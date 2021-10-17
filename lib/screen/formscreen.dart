import 'package:basic_flutter/model/Student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  //prepare fisebase
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("แบบฟอร์มบันทึกคะแนน"),
              ),
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please Input Name"),
                            onSaved: (String? val) {
                              myStudent.fname = val!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Surname",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please Input SurName"),
                            onSaved: (String? val) {
                              myStudent.lname = val!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: MultiValidator([
                              EmailValidator(errorText: "Email Incorrect"),
                              RequiredValidator(errorText: "Please Input Score")
                            ]),
                            onSaved: (String? val) {
                              myStudent.email = val!;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Score",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please Input Score"),
                            onSaved: (String? val) {
                              myStudent.score = val!;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                child: Text(
                                  "Save",
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    await _studentCollection
                                        .add({
                                          "fname": myStudent.fname,
                                          "lname": myStudent.lname,
                                          "email": myStudent.email,
                                          "score": myStudent.score,
                                        })
                                        .then((value) => print("User Added"))
                                        .catchError((error) => print(
                                            "Failed to add user: $error"));

                                    print("${myStudent.fname}");
                                    print("${myStudent.lname}");
                                    print("${myStudent.email}");
                                    print("${myStudent.score}");

                                    formKey.currentState!.reset();
                                  }
                                }),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
