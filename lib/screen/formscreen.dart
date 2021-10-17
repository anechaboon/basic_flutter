import 'package:basic_flutter/model/Student.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  @override
  Widget build(BuildContext context) {
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
                  onSaved: (String? val){
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
                  onSaved: (String? val){
                    myStudent.lname = val!;
                  },),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? val){
                    myStudent.email = val!;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Score",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? val){
                    myStudent.score = val!;
                  },
                ),
                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        //   formKey.currentState!.save();
                        // }
                        formKey.currentState!.save();

                        print("${myStudent.fname}");
                        print("${myStudent.lname}");
                        print("${myStudent.email}");
                        print("${myStudent.score}");
                      }),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
