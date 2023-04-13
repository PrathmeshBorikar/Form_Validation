import 'package:flutter/material.dart';
void main()=> runApp(const Myclass());
class Myclass extends StatefulWidget {
  const Myclass({super.key});

  @override
  createState()  => MyClassState();
}
class MyClassState extends State<Myclass> {
  // ignore: prefer_typing_uninitialized_variables
  var name;
  // ignore: prefer_typing_uninitialized_variables
  var age;
  var formkey = GlobalKey<FormState>();
  var namecontroller_1 = TextEditingController();
  var agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text('Form Validation')),
        body: Form(key: formkey, child: Column(children: [

          TextFormField(decoration: const InputDecoration(labelText: 'Name'),
              controller: namecontroller_1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name';
                }
                return null;
              }),

          TextFormField(decoration: const InputDecoration(labelText: 'Age'),
            controller: agecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the age';
              }
              return null;
            },
          ),
          ElevatedButton(onPressed: () {
            if (formkey.currentState!.validate()) {
              setState(() {
                name = namecontroller_1.text;
                age = agecontroller.text;
                namecontroller_1.clear();
                agecontroller.clear();
              });
            }
          },
              child: const Text('submit Details'))
        ],)),
      )
      );
  }
}