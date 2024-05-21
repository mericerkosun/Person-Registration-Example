import 'package:flutter/material.dart';

class NewRegisterPage extends StatefulWidget {
  const NewRegisterPage({super.key});

  @override
  State<NewRegisterPage> createState() => _NewRegisterPageState();
}

class _NewRegisterPageState extends State<NewRegisterPage> {

  var tfPersonName = TextEditingController();
  var tfPersonPhone = TextEditingController();

  Future<void> register(String person_name, String person_phone) async {
    print("Register : $person_name - $person_phone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0,left: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(
                  hintText: "Name"
                ),
              ),
              TextField(
                controller: tfPersonPhone,
                decoration: const InputDecoration(
                    hintText: "Phone Number"
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  register(tfPersonName.text, tfPersonPhone.text);
                },
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
